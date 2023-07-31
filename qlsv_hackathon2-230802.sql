create database qlsv_hackathon20230802;
use qlsv_hackathon20230802;

create table dmKhoa(
maKhoa varchar(20) primary key,
tenKhoa varchar(255));

insert into dmKhoa values
 ('CNTT','Công nghệ thông tin'),
 ('KT','Kế Toán'),
 ('SP','Sư Phạm');

create table nganh(
maNganh int primary key,
tenNganh varchar(255),
maKhoa varchar(20),
foreign key(maKhoa) references dmKhoa(maKhoa)
);

insert into nganh values 
(140902,'Sư phạm toán tin','SP'),
(480202,'Tin học ứng dụng', 'CNTT');

create table dmHocPhan(
maHP int primary key,
tenHocPhan varchar(255),
sodvht int,
maNganh int,
hocKy int,
foreign key (maNganh) references nganh(maNganh)
);
insert into dmHocPhan values
(1, 'Toán cao cấp A1', 4, 480202, 1),
(2, 'Tiếng Anh 1', 3, 480202, 1),
(3, 'Vật lý đại cương', 4, 480202, 1),
(4, 'Tiếng anh 2', 7, 480202, 1),
(5, 'Tiếng anh 1', 3, 140902,2),
(6, 'Xác suất thống kê',3,480202,2);


create table dmLop(
maLop varchar(255) primary key,
tenLop varchar(255),
maNganh int,
khoaHoc int,
heDT varchar(255),
namNhapHoc int,
foreign key(maNganh) references nganh(maNganh)
);
insert into dmLop values
('CT11', 'Cao đẳng tin học', 480202, 11, 'TC', 2013),
('CT12', 'Cao đẳng tin học', 480202, 12, 'CĐ', 2013),
('CT13', 'Cao đẳng tin học', 480202, 13, 'TC', 2014);


create table sinhvien(
maSV int primary key,
hoTen varchar(255),
maLop varchar(20),
gioiTinh tinyint(1),
ngaySinh date,
diaChi varchar(255),
foreign key (maLop) references dmLop(maLop)
);

insert into sinhvien values 
(1,'Phan Thanh', 'CT12', 0, '1990-09-12', 'Tuy Phước'),
(2,'Nguyễn Thị Cẩm', 'CT12', 1, '1994-01-12', 'Quy Nhơn'),
(3,'Võ Thị Hà', 'CT12', 1, '1995-07-02', 'An Nhơn'),
(4,'Trần Hoài Nam', 'CT12', 0, '1994-04-05', 'Tây Sơn'),
(5,'Trần Văn Hoàng', 'CT13', 0, '1995-08-04', 'Vĩnh Thạnh'),
(6,'Đặng Thị Thảo', 'CT13', 1, '1995-06-12', 'Quy Nhơn'),
(7,'Lê Thị Sen', 'CT13', 1, '1994-08-12', 'Phủ Mỹ'),
(8,'Nguyễn Văn Huy', 'CT11', 0, '1995-06-04', 'Tuy Phước'),
(9,'Trần Thị Thoa', 'CT11', 1, '1994-08-09', 'Hoài Nhơn');


create table diemHP (
maSV int,
maHP int,
diemHP float,
foreign key (maSV) references sinhvien(maSV),
foreign key (maHP) references dmHocPhan(maHP),
primary key(maSV,maHP)
);
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('2', '2', '5.9');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('2', '3', '4.5');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('3', '1', '4.3');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('3', '2', '6.7');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('3', '3', '7.3');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('4', '1', '4');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('4', '2', '5.2');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('4', '3', '3.5');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('5', '1', '9.8');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('5', '2', '7.9');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('5', '3', '7.5');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('6', '1', '6.1');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('6', '2', '5.6');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`, `diemHP`) VALUES ('6', '3', '4');
INSERT INTO `qlsv_hackathon20230802`.`diemHP` (`maSV`, `maHP`) VALUES ('7', '1');
UPDATE `qlsv_hackathon20230802`.`diemHP` SET `diemHP` = '6.2' WHERE (`maSV` = '7') and (`maHP` = '1');


-- 1.	 Hiển thị danh sách gồm MaSV, HoTên, MaLop, DiemHP, MaHP của những sinh viên có điểm HP >= 5     (5đ)

select sv.maSV,sv.hoTen,sv.maLop,dhp.diemHP,dhp.maHP
from sinhvien sv 
join diemHP dhp on dhp.maSV = sv.maSV
where dhp.diemHP >=5;

-- 2.	Hiển thị danh sách MaSV, HoTen, MaLop, MaHP, DiemHP, 
-- MaHP  được sắp xếp theo ưu tiên MaLop, HoTen tăng dần. (5đ)

select  sv.maSV,sv.hoTen,sv.maLop,dhp.diemHP,dhp.maHP
from sinhvien sv 
join diemHP dhp on dhp.maSV = sv.maSV
order by sv.maLop asc, sv.hoTen asc;

-- 3.Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, HocKy 
-- của những sinh viên có DiemHP từ 5  7 ở học kỳ I. (5đ)

select  sv.maSV,sv.hoTen,sv.maLop,dhp.diemHP,dmhp.hocKy
from sinhvien sv 
join diemHP dhp on dhp.maSV = sv.maSV
join dmHocPhan dmhp on dmhp.maHP = dhp.maHP
where dhp.diemHP >=5 and  dhp.diemHP <= 7 and dmhp.hocKy =1;


-- 4.	Hiển thị danh sách sinh viên gồm 
-- MaSV, HoTen, MaLop, TenLop, MaKhoa của Khoa có mã CNTT (5đ)

select  sv.maSV,sv.hoTen,dml.maLop,dml.tenLop,ng.maKhoa
from sinhvien sv 
join dmLop dml on dml.maLop = sv.maLop
join nganh ng on ng.maNganh = dml.maNganh
where ng.maKhoa = 'CNTT';


-- 5.	Cho biết MaLop, TenLop, tổng số sinh viên của mỗi lớp (SiSo): (5đ)

select sv.maLop, dml.tenLop, sum(sv.maSV)
from sinhvien sv
join dmLop dml on dml.maLop = sv.maLop
group by sv.maLop;

-- 7	Cho biết MaLop, TenLop, số lượng nam nữ theo từng lớp.

select sv.maLop, dml.tenLop, sum(sv.gioiTinh=1) as Nam , sum(sv.gioiTinh=0) as Nu
from sinhvien sv
join dmLop dml on dml.maLop = sv.maLop
group by sv.maLop;


-- 9.	Cho biết MaSV, HoTen, Số các học phần thiếu điểm (DiemHP<5) của mỗi sinh viên
select sv.maSV,sv.hoTen,count(dhp.maSV) `so luong` 
from sinhvien sv
join diemHP dhp on dhp.maSV = sv.maSV
where dhp.diemHP <5
group by sv.maSV;


-- 10.	Đếm số sinh viên có điểm HP <5 của mỗi học phần

select maHP,count(*) `so luong` 
from diemHP
where diemHP <5
group by diemHp.maHP;

-- 11.	Tính tổng số đơn vị học trình có điểm HP<5 của mỗi sinh viên

select sinhvien.maSV,sinhvien.hoTen,sum(sodvht) `so luong dvht` 
from diemHP
join sinhvien on sinhvien.maSV = diemHP.maSV
join dmHocPhan on dmHocPhan.maHP = diemHP.maHP
where diemHP.diemHP <5
group by sinhvien.maSV;



-- 12.	Cho biết MaLop, TenLop có tổng số sinh viên >2.

select dml.maLop,dml.tenLop, count(sv.maSV)
from sinhvien sv
join dmLop dml on dml.maLop = sv.maLop
group by dml.maLop
having count(sv.maSV)>2;

-- 13. Cho biết HoTen sinh viên có ít nhất 2 học phần có điểm <5. (10đ)

select sv.maSV, sv.hoTen, count(dhp.maSV)
from sinhvien sv 
join diemHP dhp on dhp.maSV = sv.maSV
where dhp.diemHP<5
group by dhp.maSV
having count(dhp.diemHP)>=2;

-- 14.	Cho biết HoTen sinh viên học ít nhất 3 học phần mã 1,2,3 (10đ)
select sv.maSV, sv.hoTen, count(dhp.maSV)
from sinhvien sv 
join diemHP dhp on dhp.maSV = sv.maSV
where dhp.maHP = 1 or dhp.maHP = 2 or dhp.maHP = 3
group by dhp.maSV
having count(dhp.maSV)>=3;













