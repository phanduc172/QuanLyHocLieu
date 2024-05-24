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

//Biểu đồ thống kê hoạt động gần đây
fetch('http://localhost:8080/dashboard/api/hoatdong')
    .then(response => response.json())
    .then(data => {
        var labels = [];
        var soLuongDangNhap = [];
        var soLuongTaiLen = [];
        var soLuongCapNhat = [];

        // Lấy 7 mục cuối cùng trong dữ liệu
        var lastSevenItems = data.slice(-7);

        // Lặp qua các mục cuối cùng và thêm dữ liệu vào các mảng
        lastSevenItems.forEach(item => {
            labels.push(item.ngay);
            if (item.loaiHoatDong === 'Đăng nhập') {
                soLuongDangNhap.push(item.soLuongHoatDong);
            } else if (item.loaiHoatDong === 'Tải lên') {
                soLuongTaiLen.push(item.soLuongHoatDong);
            } else if (item.loaiHoatDong === 'Cập nhật') {
                soLuongCapNhat.push(item.soLuongHoatDong);
            }
        });

        var ctx = document.getElementById('myChartActivity').getContext('2d');
        var myChartActivity = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [
                    {
                        label: 'Đăng nhập',
                        data: soLuongDangNhap,
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Tải lên',
                        data: soLuongTaiLen,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Cập nhật',
                        data: soLuongCapNhat,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }
                ]
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
    .catch(error => console.error('Lỗi:', error));

//Biểu đồ thống kê hoạt động gần đây