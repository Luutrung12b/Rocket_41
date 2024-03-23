console.log("------------------ Excercise 01----------------");
// Chuỗi đầu vào
var string = "Every new day is another chance to change your life.";
// Tách các từ bằng cách sử dụng khoảng trắng làm dấu phân cách
var words = string.split(/\s+/);
// Đếm số lượng từ
var soTu = words.length;
console.log("Số lượng từ trong chuỗi là:", soTu);
console.log("-------------Exercise 02-------------- ");
var string = "Stars can’t shine without darkness";
// Hàm để viết hoa chữ cái đầu của mỗi từ
function vietHoa(str) {
    return str.replace(/\b\w/g, function (char) {
        return char.toUpperCase();
    });
}
// Gọi hàm và in kết quả ra màn hình
console.log(vietHoa(string));
