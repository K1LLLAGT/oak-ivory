import express from "express";
import bodyParser from "body-parser";

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.post("/contact", (req, res) => {
    const { name, email, message } = req.body;

    console.log("📩 New Contact Form Submission:");
    console.log("Name:", name);
    console.log("Email:", email);
    console.log("Message:", message);

    res.json({ status: "success", message: "Message received. We will contact you soon." });
});

app.listen(3000, () => console.log("Contact form backend running on port 3000"));
