exports.handler = async (event) => {
    const response = {
        data:[{
                "message":"Hello World"
            },
            {
                "message":"Hello World again!"
            }
        ]
    };
return response;
};
