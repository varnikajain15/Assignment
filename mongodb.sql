db.coursedetails.insertMany( 
[
    {
        name : " Rekha kapoor " ,
        roll_no : 5,
  
        courses : [
         {
             subname : " web development "
         },
         {
             subname : " AR /VR "
         }
         ]
         
          
     }
  ]
     
)            
         
    /* to fetch */ 
    db.coursedetails.find({})