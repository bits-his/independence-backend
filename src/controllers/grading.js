import db from "../models"

export const Postgrade  = (req,res)=>{
    const {
        user_id="" ,
        content_id="",
        clearance_concise="",
        culture ="",
        presentable="",
        nationality="",
        status="",
        type=""
    }=req.body;
    const {_type=""}= req.query;

    db.sequelize.query(`call content(:user_id:,content_id,:clearance_concise,:culture,:presentable,:nationality,:status,:type,:_type)`,{
        repalcements:{
            user_id ,
            content_id,
            clearance_concise,
            culture,
            presentable,
            nationality,
            status,
            type,
            _type
        }
    }
    ).then((res)=>res.json({success:true}))
    .catch(err => res.status(500).json({ err }));
}