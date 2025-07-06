const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 4000;


const connection = mysql.createConnection({
host: 'localhost',
user: 'root',
password: 'Bich270406@',
database: 'duancsdl'
});

connection.connect((err) => {
  if (err) {
    console.error('❌ Kết nối MySQL thất bại: ' + err.message);
  } else {
    console.log('✅ Kết nối MySQL thành công!');
  }
});



// Cấu hình EJS
app.set('view engine', 'ejs');
// Middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('public'));
app.get('/', (req, res) => {
  res.render('main'); 
});



//Phiếu khám
app.get('/csdlphieukham', (req, res) => {
  const sql = `
    SELECT pk.*,
           b.tenbacsi     AS tenbacsi,
           l.thoigianhen  AS thoigianhen,
           hs.mabenhnhan  AS mabenhnhan
    FROM phieukham pk
    LEFT JOIN bacsi b       ON pk.mabacsi   = b.mabacsi
    LEFT JOIN lichhen l     ON pk.malichhen = l.malichhen
    LEFT JOIN hososuckhoe hs ON pk.mahoso   = hs.mahoso
    ORDER BY pk.maphieukham;
  `;
  connection.query(sql, (err, results) => {
    if (err) return res.status(500).send('Lỗi truy vấn CSDL: ' + err.message);
    res.render('csdlphieukham', {
      phieukham: null,
      timkiem: null,
      danhSachPhieuKham: results
    });
  });
});


app.post('/themphieukham', (req, res) => {
  const { maphieukham, trieuchung, chuandoan, ghichu, malichhen, mabacsi, mahoso } = req.body;
  const sql = `
    INSERT INTO phieukham
      (maphieukham, trieuchung, chuandoan, ghichu, malichhen, mabacsi, mahoso)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;
  connection.query(
    sql,
    [maphieukham, trieuchung, chuandoan, ghichu, malichhen, mabacsi, mahoso],
    err => {
      if (err) return res.send('Lỗi thêm phiếu khám: ' + err.message);
      res.redirect('/csdlphieukham');
    }
  );
});


app.get('/timkiemphieukham', (req, res) => {
  const { maphieukham } = req.query;
  const sqlFind = `
    SELECT pk.*,
           b.tenbacsi     AS tenbacsi,
           l.thoigianhen  AS thoigianhen,
           hs.mabenhnhan  AS mabenhnhan
    FROM phieukham pk
    LEFT JOIN bacsi b       ON pk.mabacsi   = b.mabacsi
    LEFT JOIN lichhen l     ON pk.malichhen = l.malichhen
    LEFT JOIN hososuckhoe hs ON pk.mahoso   = hs.mahoso
    WHERE pk.maphieukham = ?
  `;
  const sqlAll = sqlFind.replace(
    /WHERE[\s\S]*$/m,
    'ORDER BY pk.maphieukham;'
  );

  connection.query(sqlFind, [maphieukham], (errF, rowF) => {
    if (errF) return res.send('Lỗi tìm kiếm: ' + errF.message);
    connection.query(sqlAll, (errA, allList) => {
      if (errA) return res.send('Lỗi lấy danh sách: ' + errA.message);
      res.render('csdlphieukham', {
        phieukham: rowF[0] || null,
        timkiem: maphieukham,
        danhSachPhieuKham: allList
      });
    });
  });
});

app.post('/xoaphieukham', (req, res) => {
  const { maphieukham } = req.body;
  connection.query(
    'DELETE FROM phieukham WHERE maphieukham = ?',
    [maphieukham],
    err => {
      if (err) return res.send('Lỗi xoá phiếu khám: ' + err.message);
      res.redirect('/csdlphieukham');
    }
  );
});


app.post('/suaphieukham/:maphieukham', (req, res) => {
  const maphieukham = req.params.maphieukham;
  const { trieuchung, chuandoan, ghichu, malichhen, mabacsi, mahoso } = req.body;
  const sql = `
    UPDATE phieukham
    SET trieuchung = ?, chuandoan = ?, ghichu = ?,
        malichhen = ?, mabacsi = ?, mahoso = ?
    WHERE maphieukham = ?
  `;
  connection.query(
    sql,
    [trieuchung, chuandoan, ghichu, malichhen, mabacsi, mahoso, maphieukham],
    err => {
      if (err) return res.send('Lỗi cập nhật phiếu khám: ' + err.message);
      res.redirect('/csdlphieukham');
    }
  );
});







// Bác sĩ
app.get('/csdlbacsi', (req, res) => {
  const query = `
    SELECT bacsi.*, bacsi_sdt.sdt 
    FROM bacsi 
    LEFT JOIN bacsi_sdt ON bacsi.mabacsi = bacsi_sdt.mabacsi
  `;

  connection.query(query, (error, results) => {
    if (error) {
      return res.status(500).send('Lỗi truy vấn cơ sở dữ liệu');
    }

    res.render('csdlbacsi', {
      bacsi: null,
      timkiem: null,
      danhSachBacSi: results
    });
  });
});

app.post('/thembacsi', (req, res) => {
  const { mabacsi, tenbacsi, chuyenkhoa, luong, diachi, gioitinh, sdt } = req.body;

  const sql1 = 'INSERT INTO bacsi (mabacsi, tenbacsi, chuyenkhoa, luong, diachi, gioitinh) VALUES (?, ?, ?, ?, ?, ?)';
  const values1 = [mabacsi, tenbacsi, chuyenkhoa, luong, diachi, gioitinh];

  const sql2 = 'INSERT INTO bacsi_sdt (mabacsi, sdt) VALUES (?, ?)';
  const values2 = [mabacsi, sdt]; // Giả sử bacsi_sdt cần cả mã bác sĩ và số điện thoại

  connection.query(sql1, values1, (err1) => {
    if (err1) return res.send('Lỗi thêm bác sĩ: ' + err1.message);

    connection.query(sql2, values2, (err2) => {
      if (err2) return res.send('Đã thêm bác sĩ, nhưng lỗi khi thêm số điện thoại: ' + err2.message);

      res.redirect('/csdlbacsi');
    });
  });
});

app.get('/timkiembacsi', (req, res) => {
  const mabacsi = req.query.mabacsi;

  const sqlTim = `
    SELECT bacsi.*, bacsi_sdt.sdt 
    FROM bacsi 
    LEFT JOIN bacsi_sdt ON bacsi.mabacsi = bacsi_sdt.mabacsi 
    WHERE bacsi.mabacsi = ?
  `;
  const sqlAll = `
    SELECT bacsi.*, bacsi_sdt.sdt 
    FROM bacsi 
    LEFT JOIN bacsi_sdt ON bacsi.mabacsi = bacsi_sdt.mabacsi
  `;

  connection.query(sqlTim, [mabacsi], (errTim, resultTim) => {
    if (errTim) return res.send('Lỗi tìm kiếm: ' + errTim.message);

    connection.query(sqlAll, (errAll, resultAll) => {
      if (errAll) return res.send('Lỗi lấy danh sách bác sĩ: ' + errAll.message);

      let bacsiInfo = null;
      if (resultTim.length > 0) {
        bacsiInfo = {
          mabacsi: resultTim[0].mabacsi,
          tenbacsi: resultTim[0].tenbacsi,
          chuyenkhoa: resultTim[0].chuyenkhoa,
          luong: resultTim[0].luong,
          diachi: resultTim[0].diachi,
          gioitinh: resultTim[0].gioitinh,
          sdt: resultTim.map(r => r.sdt).filter(Boolean)
        };
      }

      res.render('csdlbacsi', {
        bacsi: bacsiInfo,
        timkiem: mabacsi,
        danhSachBacSi: resultAll
      });
    });
  });
});

app.get('/bacsi', (req, res) => {
  const query = `
    SELECT bacsi.mabacsi, bacsi.tenbacsi, bacsi.chuyenkhoa, GROUP_CONCAT(bacsi_sdt.sdt) AS sdt
    FROM bacsi 
    LEFT JOIN bacsi_sdt ON bacsi.mabacsi = bacsi_sdt.mabacsi
    GROUP BY bacsi.mabacsi
  `;

  connection.query(query, (error, results) => {
    if (error) {
      return res.status(500).send('Lỗi truy vấn cơ sở dữ liệu');
    }

    res.render('csdlbacsi', {
      bacsi: null,
      timkiem: null,
      danhSachBacSi: results
    });
  });
});

app.post('/xoabacsi', (req, res) => {
  const { mabacsi } = req.body;
  const deleteSDT = 'DELETE FROM bacsi_sdt WHERE mabacsi = ?';
  const deleteBacSi = 'DELETE FROM bacsi WHERE mabacsi = ?';
  connection.query(deleteSDT, [mabacsi], (err1) => {
    if (err1) return res.send('Lỗi xoá số điện thoại: ' + err1.message);
    connection.query(deleteBacSi, [mabacsi], (err2) => {
      if (err2) return res.send('Lỗi xoá bác sĩ: ' + err2.message);
      res.redirect('/csdlbacsi'); 
    });
  });
});


app.post('/suabacsi/:mabacsi', (req, res) => {
  const mabacsi = req.params.mabacsi;
  const { tenbacsi, chuyenkhoa, luong, diachi, gioitinh, sdt } = req.body;
  const sqlUpdate = `
    UPDATE bacsi 
    SET tenbacsi = ?, chuyenkhoa = ?, luong = ?, diachi = ?, gioitinh = ?
    WHERE mabacsi = ?
  `;
  const sqlDeleteSDT = `DELETE FROM bacsi_sdt WHERE mabacsi = ?`;
  const sqlInsertSDT = `INSERT INTO bacsi_sdt (mabacsi, sdt) VALUES ?`;
  connection.query(sqlUpdate, [tenbacsi, chuyenkhoa, luong, diachi, gioitinh, mabacsi], (err1) => {
    if (err1) return res.send('Lỗi cập nhật bác sĩ: ' + err1.message);
    connection.query(sqlDeleteSDT, [mabacsi], (err2) => {
      if (err2) return res.send('Lỗi xoá sdt cũ: ' + err2.message);
      const sdtArr = sdt.split(',').map(s => s.trim()).filter(Boolean);
      const values = sdtArr.map(so => [mabacsi, so]);
      if (values.length === 0) return res.redirect('/csdlbacsi');
      connection.query(sqlInsertSDT, [values], (err3) => {
        if (err3) return res.send('Lỗi thêm sdt mới: ' + err3.message);
        res.redirect('/csdlbacsi');
      });
    });
  });
});







//Bệnh nhân
// Hiển thị danh sách bệnh nhân
app.get('/csdlbenhnhan', (req, res) => {
  const query = `
    SELECT benhnhan.*, benhnhan_sdt.sdt
    FROM benhnhan
    LEFT JOIN benhnhan_sdt ON benhnhan.mabenhnhan = benhnhan_sdt.mabenhnhan
  `;

  connection.query(query, (error, results) => {
    if (error) return res.status(500).send('Lỗi truy vấn cơ sở dữ liệu');
    res.render('csdlbenhnhan', {
      benhnhan: null,
      timkiem: null,
      danhSachBenhnhan: results
    });
  });
});

// Thêm bệnh nhân
app.post('/thembenhnhan', (req, res) => {
  const { mabenhnhan, tenbenhnhan, socccd, sothebaohiemyte, ngaysinh, gioitinh, diachi, sdt } = req.body;

  const sql1 = `
    INSERT INTO benhnhan (mabenhnhan, socccd, sothebaohiemyte, tenbenhnhan, ngaysinh, gioitinh, diachi)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;
  const values1 = [mabenhnhan, socccd, sothebaohiemyte, tenbenhnhan, ngaysinh, gioitinh, diachi];

  connection.query(sql1, values1, (err1) => {
    if (err1) return res.send('Lỗi thêm bệnh nhân: ' + err1.message);

    const sdtArr = sdt.split(',').map(s => s.trim()).filter(Boolean);
    if (sdtArr.length === 0) return res.redirect('/csdlbenhnhan');

    const sql2 = 'INSERT INTO benhnhan_sdt (mabenhnhan, sdt) VALUES ?';
    const values2 = sdtArr.map(so => [mabenhnhan, so]);

    connection.query(sql2, [values2], (err2) => {
      if (err2) return res.send('Lỗi thêm số điện thoại: ' + err2.message);
      res.redirect('/csdlbenhnhan');
    });
  });
});

// Tìm kiếm bệnh nhân
app.get('/timkiembenhnhan', (req, res) => {
  const mabenhnhan = req.query.mabenhnhan;

  const sqlTim = `
    SELECT benhnhan.*, benhnhan_sdt.sdt
    FROM benhnhan
    LEFT JOIN benhnhan_sdt ON benhnhan.mabenhnhan = benhnhan_sdt.mabenhnhan
    WHERE benhnhan.mabenhnhan = ?
  `;
  const sqlAll = `
    SELECT benhnhan.*, benhnhan_sdt.sdt
    FROM benhnhan
    LEFT JOIN benhnhan_sdt ON benhnhan.mabenhnhan = benhnhan_sdt.mabenhnhan
  `;

  connection.query(sqlTim, [mabenhnhan], (errTim, resultTim) => {
    if (errTim) return res.send('Lỗi tìm kiếm: ' + errTim.message);

    connection.query(sqlAll, (errAll, resultAll) => {
      if (errAll) return res.send('Lỗi truy vấn danh sách: ' + errAll.message);

      let benhnhanInfo = null;
      if (resultTim.length > 0) {
        benhnhanInfo = {
          mabenhnhan: resultTim[0].mabenhnhan,
          socccd: resultTim[0].socccd,
          sothebaohiemyte: resultTim[0].sothebaohiemyte,
          tenbenhnhan: resultTim[0].tenbenhnhan,
          ngaysinh: resultTim[0].ngaysinh,
          gioitinh: resultTim[0].gioitinh,
          diachi: resultTim[0].diachi,
          sdt: resultTim.map(r => r.sdt).filter(Boolean)
        };
      }

      res.render('csdlbenhnhan', {
        benhnhan: benhnhanInfo,
        timkiem: mabenhnhan,
        danhSachBenhnhan: resultAll
      });
    });
  });
});

// Xoá bệnh nhân
app.post('/xoabenhnhan', (req, res) => {
  const { mabenhnhan } = req.body;

  const sql1 = 'DELETE FROM benhnhan_sdt WHERE mabenhnhan = ?';
  const sql2 = 'DELETE FROM benhnhan WHERE mabenhnhan = ?';

  connection.query(sql1, [mabenhnhan], (err1) => {
    if (err1) return res.send('Lỗi xoá số điện thoại: ' + err1.message);

    connection.query(sql2, [mabenhnhan], (err2) => {
      if (err2) return res.send('Lỗi xoá bệnh nhân: ' + err2.message);
      res.redirect('/csdlbenhnhan');
    });
  });
});

// Cập nhật bệnh nhân
app.post('/suabenhnhan/:mabenhnhan', (req, res) => {
  const mabenhnhan = req.params.mabenhnhan;
  const { tenbenhnhan, socccd, sothebaohiemyte, ngaysinh, gioitinh, diachi, sdt } = req.body;

  const sqlUpdate = `
    UPDATE benhnhan
    SET socccd = ?, sothebaohiemyte = ?, tenbenhnhan = ?, ngaysinh = ?, gioitinh = ?, diachi = ?
    WHERE mabenhnhan = ?
  `;

  connection.query(sqlUpdate, [socccd, sothebaohiemyte, tenbenhnhan, ngaysinh, gioitinh, diachi, mabenhnhan], (err1) => {
    if (err1) return res.send('Lỗi cập nhật bệnh nhân: ' + err1.message);

    const sqlDeleteSDT = 'DELETE FROM benhnhan_sdt WHERE mabenhnhan = ?';
    connection.query(sqlDeleteSDT, [mabenhnhan], (err2) => {
      if (err2) return res.send('Lỗi xoá sdt cũ: ' + err2.message);

      const sdtArr = sdt.split(',').map(s => s.trim()).filter(Boolean);
      if (sdtArr.length === 0) return res.redirect('/csdlbenhnhan');

      const sqlInsertSDT = 'INSERT INTO benhnhan_sdt (mabenhnhan, sdt) VALUES ?';
      const values = sdtArr.map(so => [mabenhnhan, so]);

      connection.query(sqlInsertSDT, [values], (err3) => {
        if (err3) return res.send('Lỗi thêm sdt mới: ' + err3.message);
        res.redirect('/csdlbenhnhan');
      });
    });
  });
});



 






//nhân viên
app.get('/csdlnhanvien', (req, res) => {
  const query = 'SELECT * FROM nhanvien';
  connection.query(query, (error, results) => {
    if (error) {
      return res.status(500).send('Lỗi truy vấn cơ sở dữ liệu');
    }
    res.render('csdlnhanvien', {
      nhanvien: null,
      timkiem: null,
      danhSachNhanvien: results
    });
  });
});

app.post('/themnhanvien', (req, res) => {
  const { maNV, hoten, luong, diachi, gioitinh, chucvu } = req.body;

  const sql = 'INSERT INTO nhanvien (maNV, hoten, luong, diachi, gioitinh, chucvu) VALUES (?, ?, ?, ?, ?, ?)';
  const values = [maNV, hoten, luong, diachi, gioitinh, chucvu];

  connection.query(sql, values, (err) => {
    if (err) return res.send('Lỗi thêm nhân viên: ' + err.message);
    res.redirect('/csdlnhanvien');
  });
});


app.get('/timkiemnhanvien', (req, res) => {
  const maNV = req.query.maNV;

  const sqlTim = 'SELECT * FROM nhanvien WHERE maNV = ?';
  const sqlAll = 'SELECT * FROM nhanvien';

  connection.query(sqlTim, [maNV], (errTim, resultTim) => {
    if (errTim) return res.send('Lỗi tìm kiếm: ' + errTim.message);

    connection.query(sqlAll, (errAll, resultAll) => {
      if (errAll) return res.send('Lỗi lấy danh sách nhân viên: ' + errAll.message);

      res.render('csdlnhanvien', {
        nhanvien: resultTim[0] || null,
        timkiem: maNV,
        danhSachNhanvien: resultAll
      });
    });
  });
});


app.post('/xoanhanvien', (req, res) => {
  const { maNV } = req.body;

  const sql = 'DELETE FROM nhanvien WHERE maNV = ?';
  connection.query(sql, [maNV], (err) => {
    if (err) return res.send('Lỗi xoá nhân viên: ' + err.message);
    res.redirect('/csdlnhanvien');
  });
});


app.post('/suanhanvien/:maNV', (req, res) => {
  const maNV = req.params.maNV;
  const { hoten, luong, diachi, gioitinh, chucvu } = req.body;

  const sqlUpdate = `
    UPDATE nhanvien 
    SET hoten = ?, luong = ?, diachi = ?, gioitinh = ?, chucvu = ? 
    WHERE maNV = ?
  `;

  connection.query(sqlUpdate, [hoten, luong, diachi, gioitinh, chucvu, maNV], (err) => {
    if (err) return res.send('Lỗi cập nhật nhân viên: ' + err.message);
    res.redirect('/csdlnhanvien');
  });
});







//Đơn thuốc
app.get('/csdldonthuoc', (req, res) => {
  const sqlAll = 'SELECT * FROM donthuoc';
  connection.query(sqlAll, (err, resultsAll) => {
    if (err) return res.status(500).send('Lỗi truy vấn CSDL: ' + err.message);

    res.render('csdldonthuoc', {
      donthuoc: null,         
      timkiem: null,           
      danhSachDonThuoc: resultsAll
    });
  });
});

app.post('/themdonthuoc', (req, res) => {
  const { madonthuoc, cachdung, lieuluong, maphieukham } = req.body;
  const sqlInsert = `
    INSERT INTO donthuoc (madonthuoc, cachdung, lieuluong, maphieukham)
    VALUES (?, ?, ?, ?)
  `;
  connection.query(sqlInsert, [madonthuoc, cachdung, lieuluong, maphieukham], err => {
    if (err) return res.send('Lỗi thêm đơn thuốc: ' + err.message);
    res.redirect('/csdldonthuoc');
  });
});

app.post('/xoadonthuoc', (req, res) => {
  const { madonthuoc } = req.body;
  const sqlDelete = 'DELETE FROM donthuoc WHERE madonthuoc = ?';
  connection.query(sqlDelete, [madonthuoc], err => {
    if (err) return res.send('Lỗi xoá đơn thuốc: ' + err.message);
    res.redirect('/csdldonthuoc');
  });
});


app.get('/timkiemdonthuoc', (req, res) => {
  const { madonthuoc } = req.query;
  const sqlFind = 'SELECT * FROM donthuoc WHERE madonthuoc = ?';

  connection.query(sqlFind, [madonthuoc], (errFind, resultsFind) => {
    if (errFind) return res.status(500).send('Lỗi truy vấn tìm kiếm: ' + errFind.message);
    const sqlAll = 'SELECT * FROM donthuoc';
    connection.query(sqlAll, (errAll, resultsAll) => {
      if (errAll) return res.status(500).send('Lỗi truy vấn danh sách: ' + errAll.message);

      res.render('csdldonthuoc', {
        donthuoc: resultsFind[0] || null,
        timkiem: madonthuoc,
        danhSachDonThuoc: resultsAll
      });
    });
  });
});


app.post('/suadonthuoc/:madonthuoc', (req, res) => {
  const { madonthuoc } = req.params;
  const { cachdung, lieuluong, maphieukham } = req.body;
  const sqlUpdate = `
    UPDATE donthuoc
    SET cachdung = ?, lieuluong = ?, maphieukham = ?
    WHERE madonthuoc = ?
  `;
  connection.query(
    sqlUpdate,
    [cachdung, lieuluong, maphieukham, madonthuoc],
    err => {
      if (err) return res.send('Lỗi cập nhật đơn thuốc: ' + err.message);
      res.redirect('/csdldonthuoc');
    }
  );
});

 







//chi tiết hóa đơn
app.get('/csdlchitiethoadon', (req, res) => {
  const query = 'SELECT * FROM chitiethoadon';

  connection.query(query, (error, results) => {
    if (error) return res.status(500).send('Lỗi truy vấn cơ sở dữ liệu');

    res.render('csdlchitiethoadon', {
      chitiethoadon: null,
      timkiem: null,
      danhSachChiTiet: results
    });
  });
});

app.get('/timkiemchitiethoadon', (req, res) => {
  const { mahoadon } = req.query;

  const sqlTim = 'SELECT * FROM chitiethoadon WHERE mahoadon = ?';
  const sqlAll = 'SELECT * FROM chitiethoadon';

  connection.query(sqlTim, [mahoadon], (err1, result1) => {
    if (err1) return res.send('Lỗi tìm kiếm: ' + err1.message);
    connection.query(sqlAll, (err2, result2) => {
      if (err2) return res.send('Lỗi truy vấn tất cả: ' + err2.message);
      res.render('csdlchitiethoadon', {
        chitiethoadon: result1,
        timkiem: mahoadon,
        danhSachChiTiet: result2
      });
    });
  });
});




app.post('/themchitiethoadon', (req, res) => {
  const { mahoadon, mathuoc, soluong, donvitinh, dongia } = req.body;

  const sql = 'INSERT INTO chitiethoadon (mahoadon, mathuoc, soluong, donvitinh, dongia) VALUES (?, ?, ?, ?, ?)';
  connection.query(sql, [mahoadon, mathuoc, soluong, donvitinh, dongia], (err) => {
    if (err) return res.send('Lỗi thêm chi tiết hóa đơn: ' + err.message);
    res.redirect('/csdlchitiethoadon');
  });
});

app.post('/xoachitiethoadon', (req, res) => {
  const { mahoadon, mathuoc } = req.body;

  const sql = 'DELETE FROM chitiethoadon WHERE mahoadon = ? AND mathuoc = ?';
  connection.query(sql, [mahoadon, mathuoc], (err) => {
    if (err) return res.send('Lỗi xoá: ' + err.message);
    res.redirect('/csdlchitiethoadon');
  });
});


app.post('/suachitiethoadon/:mahoadon/:mathuoc', (req, res) => {
  const { mahoadon, mathuoc } = req.params;
  const { soluong, donvitinh, dongia } = req.body;

  const sql = `UPDATE chitiethoadon SET soluong = ?, donvitinh = ?, dongia = ? WHERE mahoadon = ? AND mathuoc = ?`;
  connection.query(sql, [soluong, donvitinh, dongia, mahoadon, mathuoc], (err) => {
    if (err) return res.send('Lỗi cập nhật: ' + err.message);
    res.redirect('/csdlchitiethoadon');
  });
});







//hóa đơn

app.get('/csdlhoadon', (req, res) => {
  const sql = 'SELECT * FROM hoadon';
  connection.query(sql, (err, results) => {
    if (err) return res.send('Lỗi truy vấn: ' + err.message);
    res.render('csdlhoadon', { hoadon: null, timkiem: null, danhSachHoadon: results });
  });
});

app.post('/themhoadon', (req, res) => {
  const { mahoadon, maphieukham, mabenhnhan, ngaylap, trangthai } = req.body;
  const sql = 'INSERT INTO hoadon (mahoadon, maphieukham, mabenhnhan, ngaylap, trangthai) VALUES (?, ?, ?, ?, ?)';
  connection.query(sql, [mahoadon, maphieukham, mabenhnhan, ngaylap, trangthai], (err) => {
    if (err) return res.send('Lỗi thêm hóa đơn: ' + err.message);
    res.redirect('/csdlhoadon');
  });
});


app.get('/timkiemhoadon', (req, res) => {
  const mahoadon = req.query.mahoadon;
  const sql1 = 'SELECT * FROM hoadon WHERE mahoadon = ?';
  const sql2 = 'SELECT * FROM hoadon';

  connection.query(sql1, [mahoadon], (err1, result1) => {
    if (err1) return res.send('Lỗi tìm kiếm: ' + err1.message);
    connection.query(sql2, (err2, result2) => {
      if (err2) return res.send('Lỗi danh sách: ' + err2.message);
      res.render('csdlhoadon', {
        hoadon: result1[0] || null,
        timkiem: mahoadon,
        danhSachHoadon: result2
      });
    });
  });
});

app.post('/xoahoadon', (req, res) => {
  const { mahoadon } = req.body;
  const sql = 'DELETE FROM hoadon WHERE mahoadon = ?';
  connection.query(sql, [mahoadon], (err) => {
    if (err) return res.send('Lỗi xoá: ' + err.message);
    res.redirect('/csdlhoadon');
  });
});


app.post('/suahoadon/:mahoadon', (req, res) => {
  const { maphieukham, mabenhnhan, ngaylap, trangthai } = req.body;
  const { mahoadon } = req.params;
  const sql = `UPDATE hoadon SET maphieukham=?, mabenhnhan=?, ngaylap=?, trangthai=? WHERE mahoadon=?`;
  connection.query(sql, [maphieukham, mabenhnhan, ngaylap, trangthai, mahoadon], (err) => {
    if (err) return res.send('Lỗi cập nhật: ' + err.message);
    res.redirect('/csdlhoadon');
  });
});










//hồ sơ
app.get('/csdlhososuckhoe', (req, res) => {
  const sql = 'SELECT * FROM hososuckhoe';
  connection.query(sql, (err, results) => {
    if (err) return res.send('Lỗi truy vấn: ' + err.message);
    res.render('csdlhososuckhoe', {
      hoso: null,
      timkiem: null,
      danhSachHoso: results
    });
  });
});

app.post('/themhoso', (req, res) => {
  const { mahoso, mabenhnhan, tiensubenh, thuocdangsd, diung, tiemchung, lienhekhancap} = req.body;
  const sql = `
    INSERT INTO hososuckhoe (mahoso, mabenhnhan, tiensubenh, thuocdangsd, diung, tiemchung, lienhekhancap)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;
  connection.query(sql, [mahoso, mabenhnhan, tiensubenh, thuocdangsd, diung, tiemchung, lienhekhancap], (err) => {
    if (err) return res.send('Lỗi thêm hồ sơ: ' + err.message);
    res.redirect('/csdlhososuckhoe');
  });
});

app.get('/timkiemhoso', (req, res) => {
  const mahoso = req.query.mahoso;
  const sql1 = 'SELECT * FROM hososuckhoe WHERE mahoso = ?';
  const sql2 = 'SELECT * FROM hososuckhoe';

  connection.query(sql1, [mahoso], (err1, result1) => {
    if (err1) return res.send('Lỗi tìm kiếm: ' + err1.message);
    connection.query(sql2, (err2, result2) => {
      if (err2) return res.send('Lỗi danh sách: ' + err2.message);
      res.render('csdlhososuckhoe', {
        hoso: result1[0] || null,
        timkiem: mahoso,
        danhSachHoso: result2
      });
    });
  });
});


app.post('/xoahoso', (req, res) => {
  const { mahoso } = req.body;
  const sql = 'DELETE FROM hososuckhoe WHERE mahoso = ?';
  connection.query(sql, [mahoso], (err) => {
    if (err) return res.send('Lỗi xoá: ' + err.message);
    res.redirect('/csdlhososuckhoe');
  });
});

app.post('/suahoso/:mahoso', (req, res) => {
  const { mahoso } = req.params;
  const { mabenhnhan, tiensubenh, thuocdangsd, diung, tiemchung, lienhekhancap} = req.body;
  const sql = `
    UPDATE hososuckhoe SET mabenhnhan=?, tiensubenh=?, thuocdangsd=?, diung=?, tiemchung=?, lienhekhancap=?,
    WHERE mahoso=?
  `;
  connection.query(sql, [mabenhnhan, tiensubenh, thuocdangsd, diung, tiemchung, lienhekhancap, mahoso], (err) => {
    if (err) return res.send('Lỗi cập nhật hồ sơ: ' + err.message);
    res.redirect('/csdlhososuckhoe');
  });
});








//lịch hẹn

app.get('/csdllichhen', (req, res) => {
  connection.query('SELECT * FROM lichhen', (err, results) => {
    if (err) return res.status(500).send('Lỗi truy vấn CSDL: ' + err.message);
    res.render('csdllichhen', {
      lichhen: null,
      timkiem: null,
      danhSachLichHen: results 
    });
  });
});

function loadFkData(callback) {
  const data = {};
  connection.query('SELECT mabacsi, tenbacsi FROM bacsi', (e1, bsList) => {
    if (e1) return callback(e1);
    data.bacsiList = bsList;
    connection.query('SELECT mabenhnhan, tenbenhnhan FROM benhnhan', (e2, bnList) => {
      if (e2) return callback(e2);
      data.benhnhanList = bnList;
      connection.query('SELECT maNV, tennhanvien FROM nhanvien', (e3, nvList) => {
        if (e3) return callback(e3);
        data.nhanvienList = nvList;
        callback(null, data);
      });
    });
  });
}


app.get('/csdllichhen', (req, res) => {
  const sqlAll = `
    SELECT l.*,
           b.tenbacsi         AS tenbacsi,
           bn.tenbenhnhan     AS tenbenhnhan,
           nv.tennhanvien     AS tennhanvien
    FROM lichhen l
    LEFT JOIN bacsi b   ON l.mabacsi      = b.mabacsi
    LEFT JOIN benhnhan bn ON l.mabenhnhan = bn.mabenhnhan
    LEFT JOIN nhanvien nv ON l.maNV       = nv.maNV
    ORDER BY l.thoigianhen DESC
  `;

  connection.query(sqlAll, (errAll, lichList) => {
    if (errAll) return res.status(500).send('Lỗi truy vấn CSDL: ' + errAll.message);

    loadFkData((errFk, fkData) => {
      if (errFk) return res.status(500).send('Lỗi load FK data: ' + errFk.message);

      res.render('csdllichhen', {
        lichhen: null,
        timkiem: null,
        danhSachLichHen: lichList,
        ...fkData
      });
    });
  });
});

// 2. Thêm lịch hẹn (không nhập maNV)
app.post('/themlichhen', (req, res) => {
  const { malichhen, mabacsi, mabenhnhan, thoigianhen, tinhtrang, ghichu } = req.body;
  const sql = `
    INSERT INTO lichhen
      (malichhen, mabacsi, mabenhnhan, thoigianhen, tinhtrang, ghichu)
    VALUES (?, ?, ?, ?, ?, ?)
  `;
  connection.query(
    sql,
    [malichhen, mabacsi, mabenhnhan, thoigianhen, tinhtrang, ghichu],
    err => {
      if (err) return res.send('Lỗi thêm lịch hẹn: ' + err.message);
      res.redirect('/csdllichhen');
    }
  );
});

// 3. Tìm kiếm lịch hẹn theo mã (vẫn JOIN lấy tên)
app.get('/timkiemlichhen', (req, res) => {
  const { malichhen } = req.query;
  const sqlFind = `
    SELECT l.*,
           b.tenbacsi     AS tenbacsi,
           bn.tenbenhnhan AS tenbenhnhan,
           nv.tennhanvien AS tennhanvien
    FROM lichhen l
    LEFT JOIN bacsi b   ON l.mabacsi      = b.mabacsi
    LEFT JOIN benhnhan bn ON l.mabenhnhan = bn.mabenhnhan
    LEFT JOIN nhanvien nv ON l.maNV       = nv.maNV
    WHERE l.malichhen = ?
  `;
  const sqlAll = `
    SELECT l.*,
           b.tenbacsi, bn.tenbenhnhan, nv.tennhanvien
    FROM lichhen l
    LEFT JOIN bacsi b   ON l.mabacsi      = b.mabacsi
    LEFT JOIN benhnhan bn ON l.mabenhnhan = bn.mabenhnhan
    LEFT JOIN nhanvien nv ON l.maNV       = nv.maNV
    ORDER BY l.thoigianhen DESC
  `;

  connection.query(sqlFind, [malichhen], (errF, rowsF) => {
    if (errF) return res.send('Lỗi tìm kiếm: ' + errF.message);

    connection.query(sqlAll, (errA, allList) => {
      if (errA) return res.send('Lỗi lấy danh sách: ' + errA.message);

      loadFkData((errFk, fkData) => {
        if (errFk) return res.send('Lỗi load FK data: ' + errFk.message);

        res.render('csdllichhen', {
          lichhen: rowsF[0] || null,
          timkiem: malichhen,
          danhSachLichHen: allList,
          ...fkData
        });
      });
    });
  });
});

// 4. Xóa lịch hẹn
app.post('/xoalichhen', (req, res) => {
  const { malichhen } = req.body;
  connection.query('DELETE FROM lichhen WHERE malichhen = ?', [malichhen], err => {
    if (err) return res.send('Lỗi xoá lịch hẹn: ' + err.message);
    res.redirect('/csdllichhen');
  });
});

// 5. Sửa lịch hẹn
app.post('/sualichhen/:malichhen', (req, res) => {
  const malichhen = req.params.malichhen;
  const { mabacsi, mabenhnhan, thoigianhen, tinhtrang, ghichu, maNV } = req.body;
  const sql = `
    UPDATE lichhen
    SET mabacsi     = ?,
        mabenhnhan  = ?,
        thoigianhen = ?,
        tinhtrang   = ?,
        ghichu      = ?,
        maNV        = ?
    WHERE malichhen = ?
  `;
  connection.query(
    sql,
    [mabacsi, mabenhnhan, thoigianhen, tinhtrang, ghichu, maNV, malichhen],
    err => {
      if (err) return res.send('Lỗi cập nhật lịch hẹn: ' + err.message);
      res.redirect('/csdllichhen');
    }
  );
});









//người thân
app.get('/csdlnguoithan', (req, res) => {
  const sql = 'SELECT * FROM nguoithan';
  connection.query(sql, (err, results) => {
    if (err) return res.send('Lỗi truy vấn người thân: ' + err.message);
    res.render('csdlnguoithan', {
      nguoithan: null,
      timkiem: null,
      danhSachNguoithan: results
    });
  });
});

app.post('/themnguoithan', (req, res) => {
  const { mabenhnhan, hoten, moiquanhe, sdt } = req.body;
  const sql = `
    INSERT INTO nguoithan (mabenhnhan, hoten, moiquanhe, sdt)
    VALUES (?, ?, ?, ?)
  `;
  connection.query(sql, [mabenhnhan, hoten, moiquanhe, sdt], (err) => {
    if (err) return res.send('Lỗi thêm người thân: ' + err.message);
    res.redirect('/csdlnguoithan');
  });
});


app.get('/timkiemnguoithan', (req, res) => {
  const mabenhnhan = req.query.mabenhnhan;
  const sqlTim = 'SELECT * FROM nguoithan WHERE mabenhnhan = ?';
  const sqlAll = 'SELECT * FROM nguoithan';

  connection.query(sqlTim, [mabenhnhan], (err1, result1) => {
    if (err1) return res.send('Lỗi tìm kiếm: ' + err1.message);
    connection.query(sqlAll, (err2, result2) => {
      if (err2) return res.send('Lỗi truy vấn toàn bộ: ' + err2.message);
      res.render('csdlnguoithan', {
        nguoithan: result1[0] || null,
        timkiem: mabenhnhan,
        danhSachNguoithan: result2
      });
    });
  });
});

app.post('/xoanguoithan', (req, res) => {
  const { mabenhnhan } = req.body;
  const sql = 'DELETE FROM nguoithan WHERE mabenhnhan = ?';
  connection.query(sql, [mabenhnhan], (err) => {
    if (err) return res.send('Lỗi xoá người thân: ' + err.message);
    res.redirect('/csdlnguoithan');
  });
});


app.post('/suanguoithan/:mabenhnhan', (req, res) => {
  const mabenhnhan = req.params.mabenhnhan;
  const { hoten, moiquanhe, sdt } = req.body;
  const sql = `
    UPDATE nguoithan
    SET hoten=?, moiquanhe=?, sdt=?
    WHERE mabenhnhan=?
  `;
  connection.query(sql, [hoten, moiquanhe, sdt, mabenhnhan], (err) => {
    if (err) return res.send('Lỗi cập nhật người thân: ' + err.message);
    res.redirect('/csdlnguoithan');
  });
});









//thuốc
app.get('/csdlthuoc', (req, res) => {
  const sql = 'SELECT * FROM thuoc';
  connection.query(sql, (err, results) => {
    if (err) return res.send('Lỗi truy vấn thuốc: ' + err.message);
    res.render('csdlthuoc', {
      thuoc: null,
      timkiem: null,
      danhSachThuoc: results
    });
  });
});

app.post('/themthuoc', (req, res) => {
  const { mathuoc, tenthuoc, hansudung, huongdansudung } = req.body;
  const sql = 'INSERT INTO thuoc (mathuoc, tenthuoc, hansudung, huongdansudung) VALUES (?, ?, ?, ?)';
  connection.query(sql, [mathuoc, tenthuoc, hansudung, huongdansudung], (err) => {
    if (err) return res.send('Lỗi thêm thuốc: ' + err.message);
    res.redirect('/csdlthuoc');
  });
});


app.get('/timkiemthuoc', (req, res) => {
  const mathuoc = req.query.mathuoc;
  const sqlTim = 'SELECT * FROM thuoc WHERE mathuoc = ?';
  const sqlAll = 'SELECT * FROM thuoc';
  connection.query(sqlTim, [mathuoc], (err1, result1) => {
    if (err1) return res.send('Lỗi tìm kiếm: ' + err1.message);
    connection.query(sqlAll, (err2, result2) => {
      if (err2) return res.send('Lỗi truy vấn tất cả: ' + err2.message);
      res.render('csdlthuoc', {
        thuoc: result1[0] || null,
        timkiem: mathuoc,
        danhSachThuoc: result2
      });
    });
  });
});

app.post('/xoathuoc', (req, res) => {
  const { mathuoc } = req.body;
  const sql = 'DELETE FROM thuoc WHERE mathuoc = ?';
  connection.query(sql, [mathuoc], (err) => {
    if (err) return res.send('Lỗi xoá thuốc: ' + err.message);
    res.redirect('/csdlthuoc');
  });
});


app.post('/suathuoc/:mathuoc', (req, res) => {
  const { tenthuoc, hansudung, huongdansudung } = req.body;
  const sql = `
    UPDATE thuoc
    SET tenthuoc = ?, hansudung = ?, huongdansudung = ?
    WHERE mathuoc = ?
  `;
  connection.query(sql, [tenthuoc, hansudung, huongdansudung, req.params.mathuoc], (err) => {
    if (err) return res.send('Lỗi cập nhật thuốc: ' + err.message);
    res.redirect('/csdlthuoc');
  });
});

app.listen(port, () => {
  console.log(`Server chạy tại http://localhost:${port}`);
});



