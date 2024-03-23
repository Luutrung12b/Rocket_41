console.log("--------------Exercise 02 question 01 --------------");
// Khai báo và khởi tạo lương của Account 1 và Account 2
var luongAccount1 = 5240.5;
var luongAccount2 = 10970.055;

// Làm tròn lương của Account 1 và in ra số int tương ứng
var luongLamTron1 = Math.round(luongAccount1);
console.log("Lương của Account 1 sau khi làm tròn là:", luongLamTron1);

// Làm tròn lương của Account 2 và in ra số int tương ứng
var luongLamTron2 = Math.round(luongAccount2);
console.log("Lương của Account 2 sau khi làm tròn là:", luongLamTron2);






console.log("================================================================================");
console.log("--------------Exercise 02 question 02 + 03 --------------");
// Hàm để lấy ngẫu nhiên một số có 5 chữ số
function laySoNgauNhien() {
    // Lấy một số ngẫu nhiên từ 0 đến 99999
    var randomNumber = Math.floor(Math.random() * 100000).toString();

    // Nếu số có ít hơn 5 chữ số, thêm số 0 ở đầu cho đủ 5 chữ số
    while (randomNumber.length < 5) {
        randomNumber = "0" + randomNumber;
    }

    return randomNumber;
}

// Lấy số ngẫu nhiên có 5 chữ số và in ra
var soNgauNhien = laySoNgauNhien();
console.log("Số ngẫu nhiên có 5 chữ số:", soNgauNhien);

var haiSoCuoi = soNgauNhien.slice(-2);
console.log("Hai số cuối cùng:", haiSoCuoi);

console.log("=========================================================================");
console.log("--------------------------Exercise 03-----------------------------------");

// Khai báo một mảng có các chữ từ "a" tới "e"
var array = ["a", "b", "c", "d", "e"];

// In ra các phần tử của mảng theo index và giá trị tương ứng
console.log("In ra các phần tử của mảng theo index và giá trị:");
for (var i = 0; i < array.length; i++) {
    console.log("Index:", i, "Value:", array[i]);
}


