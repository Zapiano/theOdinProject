var mPrim = function(number)
{
    var primo = number;
    var divisor = 3;
    var stop = false;
    var achou = true;

    while (stop === false)
    {
        while(divisor < primo && stop === false)
        {
            if(primo%divisor === 0)
            {
                stop = true;
            }
            else {divisor = divisor + 2;} 
        }
        
        if(stop === true)
        {
            primo = primo - 2;
            divisor = 3;
            stop = false;
        }
        else 
        {
            stop = true;
        }
    }

        return primo;
};

console.log(mPrim(10000));