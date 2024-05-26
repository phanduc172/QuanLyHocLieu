//Biểu đồ thống kê số lượng tài liệu tải lên
// Thực hiện yêu cầu HTTP GET để lấy dữ liệu từ endpoint
fetch('http://localhost:8080/dashboard/api/tailieu')
    .then(response => response.json())
    .then(data => {
        // Lấy chỉ 10 ngày mới nhất từ dữ liệu
        const lastTenDaysData = data.slice(-7);

        // Lấy dữ liệu từ phản hồi JSON
        const labels = lastTenDaysData.map(entry => entry.ngay);
        const values = lastTenDaysData.map(entry => entry.soLuongTaiLieu);

        // Vẽ biểu đồ
        const ctx = document.getElementById('myChartDocument').getContext('2d');
        const myChartDocument = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Số lượng tài liệu tải lên theo ngày',
                    data: values,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    })
    .catch(error => {
        console.error('Error fetching data:', error);
    });
//Biểu đồ thống kê số lượng tài liệu tải lên
// Tạo một đối tượng XMLHttpRequest

var xhttp = new XMLHttpRequest();

// Đặt hàm xử lý sự kiện cho khi nhận được phản hồi từ API
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        // Khi nhận được phản hồi, lấy dữ liệu JSON từ phản hồi
        var activitiesData = JSON.parse(this.responseText);

        // Tạo một đối tượng Map để lưu trữ dữ liệu của từng ngày
        var dailyDataMap = {};

        // Lặp qua dữ liệu và tính tổng số hoạt động của mỗi loại trong cùng một ngày
        activitiesData.forEach(function(activity) {
            var ngay = activity.ngay;
            var loaiHoatDong = activity.loaiHoatDong;
            var soLuongHoatDong = activity.soLuongHoatDong;

            // Kiểm tra xem ngày đã tồn tại trong dailyDataMap chưa
            if (!dailyDataMap[ngay]) {
                dailyDataMap[ngay] = {};
            }

            // Tăng số lượng hoạt động của loại tương ứng trong ngày
            if (!dailyDataMap[ngay][loaiHoatDong]) {
                dailyDataMap[ngay][loaiHoatDong] = soLuongHoatDong;
            } else {
                dailyDataMap[ngay][loaiHoatDong] += soLuongHoatDong;
            }
        });

        // Biến dữ liệu trong dailyDataMap thành mảng dữ liệu để tạo biểu đồ
        var dates = Object.keys(dailyDataMap);
        var loginCounts = [];
        var uploadCounts = [];
        var updateCounts = [];

        dates.forEach(function(ngay) {
            loginCounts.push(dailyDataMap[ngay]["Đăng nhập"] || 0);
            uploadCounts.push(dailyDataMap[ngay]["Tải lên"] || 0);
            updateCounts.push(dailyDataMap[ngay]["Cập nhật"] || 0);
        });

        // Tạo biểu đồ từ dữ liệu đã tính toán
        var ctx = document.getElementById('myChartActivity').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: dates,
                datasets: [{
                    label: 'Đăng nhập',
                    data: loginCounts,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }, {
                    label: 'Tải lên',
                    data: uploadCounts,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }, {
                    label: 'Cập nhật',
                    data: updateCounts,
                    backgroundColor: 'rgba(255, 206, 86, 0.2)',
                    borderColor: 'rgba(255, 206, 86, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
};

// Mở một yêu cầu GET đến API
xhttp.open("GET", "http://localhost:8080/dashboard/api/hoatdong", true);
xhttp.send();

// //Biểu đồ thống kê hoạt động gần đây