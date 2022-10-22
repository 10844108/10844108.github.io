/* 此check()函式在最後的「傳送」案鈕會用到 */
        function check()
        {
                /* 若<form>屬性name值為reg裡的文字方塊值為空字串，則顯示「未輸入姓名」 */
                if(reg.firstname.value == "") 
                {
                        alert("未輸入姓名!");
                }
             
                else if(reg.email.value == "") 
                {
                        alert("未輸入信箱!");
                }
                else if(reg.address.value == "") 
                {
                        alert("未輸入地址!");
                }
                else if(reg.city.value == "") 
                {
                        alert("未輸入城市!");
                }
                else if(reg.cardname.value == "") 
                {
                        alert("未輸入卡片持有者姓名!");
                }
                else if(reg.cardnumber.value == "") 
                {
                        alert("未輸入卡片號碼!");
                }
                else if(reg.expmonth.value == "") 
                {
                        alert("未輸入到期月份!");
                }
                else if(reg.expyear.value == "") 
                {
                        alert("未輸入到期年份!");
                }
                else if(reg.cvv.value == "") 
                {
                        alert("未輸入驗證碼!");
                }

                
                
               /* 若以上條件皆不符合，也就是表單資料皆有填寫的話，則將資料送出 */
                else reg.submit();
         }