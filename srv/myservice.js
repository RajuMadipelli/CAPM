module.exports= async(srv)=>{
    srv.on("greetings",(req,res)=>{
        return "good morning"+ " "+req.data.name;
})}