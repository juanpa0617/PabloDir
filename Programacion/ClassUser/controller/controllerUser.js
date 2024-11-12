const User = requiere('../models/user');

const getUser = async (req, res) => {
    const Users = await User.find();
    res.json(Users);
}


const postUser = async (req, res) => {
    const body = req.body;
    let msg = "User created";
    try{
        const User = new Owener(body);
        await User.save();
        res.json(msg);
    }
    catch(error){
        msg = error;
        res.json(msg);
    }
}


const putUser = async (req, res) => {
    const {document,name,password,telefono,rol} = req.body
    let msg = "User update succesfull"
    try {
        await.User.findUpdate({document:document }, {name:name,password:password,telefono:telefono,rol:rol})
    } catch (error) {
        msg = error
    }
    res.json(msg)



}