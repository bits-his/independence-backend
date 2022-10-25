const { Postgrade } = require("../controllers/grading");

module.exports=(app)=>{
    app.post("/post-grade",Postgrade
    )
}