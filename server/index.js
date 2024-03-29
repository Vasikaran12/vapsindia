const express = require("express");
const app = express();
const stream = require("stream");
const multer = require("multer");
const {google} = require("googleapis");
const upload = multer();
const path = require("path");
const cors = require("cors");

app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(express.Router());
app.use(cors());

const KEYFILEPATH = path.join(__dirname, "cred.json");
const SCOPES = ["https://www.googleapis.com/auth/drive"];

const auth = new google.auth.GoogleAuth({
  keyFile: KEYFILEPATH,
  scopes: SCOPES,
});

app.listen(3000, () => {
  console.log("Listening to port 3000");
});

app.get("/", (req, res) => {
  res.sendFile(`${__dirname}/index.html`);
});

app.post("/upload", upload.any(), async (req, res) => {
  try {
    console.log(req.body);
    console.log(req.files);
    const { files } = req;

    for (let f = 0; f < files.length; f += 1) {
      await uploadFile(files[f]);
    }

    res.status(200).send("Form Submitted");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

app.post("/get", () => {
  const drive = google.drive({ version: "v3", auth });

  drive.files.list({}, (err, res) => {
    if (err) throw err;
    const files = res.data.files;
    if (files.length) {
      files.map((file) => {
        console.log(file);
      });
    } else {
      console.log("No files found");
    }
  });
});

const uploadFile = async (fileObject) => {
  const bufferStream = new stream.PassThrough();
  bufferStream.end(fileObject.buffer);

  const drive = google.drive({ version: "v3", auth });

  const createFile = await drive.files.create({
    media: {
      mimeType: fileObject.mimetype,
      body: bufferStream,
    },
    requestBody: {
      name: fileObject.originalname,
      parents: ["1CbGGQVYPNGeAm2E39OuEQPXCRkbV2d8R"],
    },
    fields: "id,name",
  });

  console.log(`Uploaded file ${createFile.data.name} ${createFile.data.id}`);
};
