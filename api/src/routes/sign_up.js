const  express = require("express");
const app = express();
const PORT = 3000;

app.post("/database", (req,res)=>{
    res.send("Burgundary server is running...");
});

app.listen(PORT,()=>{
    console.log(`server is running on http://127.0.0.1:${PORT}`);
});