create database QuanLy_ThuVien
use QuanLy_ThuVien
create table TheLoai(
	TenTheLoai varchar(50),
	constraint PK_TENtl primary key(TenTheLoai)
)


create table NhaXuatBan(
	MaXuatBan int,
	QuocGia varchar(50),
	TenNhaXuatBan varchar(50),
	constraint PK_MaXB primary key(MaXuatBan)
)

create table ThuThu(
	MaThuThu int,
	HoTen varchar(50),
	Diachi varchar(50),
	SoDienThoai int,
	CaLam int,
	MatKhau int,
	constraint PK_MaTT primary key(MaThuThu)
)

create table DOCGIA(
	MaDocGia int,
	HoTen varchar(50),
	GioiTinh varchar(50),
	NamSinh date,
	email varchar(50),
	DiaChi varchar(50),
	SoDienThoai int,
	MatKhau int,
	constraint PK_MaDG primary key(MaDocGia)
)

create table DauSach(
	MaDauSach int,
	TenTacGia varchar(50),
	TenSach varchar(50),
	NamPhatHanh date,
	MaXB int,
	TenTL varchar(50),
	constraint PK_MaDauSach primary key(MaDauSach),
	constraint FK_MAXB foreign key(MaXB) references NhaXuatBan(MaXuatBan),
	constraint FK_TenTL foreign key(TenTL) references TheLoai(TenTheLoai)
)

create table PhieuMuonTra(
	MaPhieu int,
	NgayMuon date,
	NgayTra date,
	MaThuThu int,
	MaDocGia int,
	constraint PK_MaPhieu primary key(MaPhieu),
	constraint FK_MaTT foreign key(MaThuThu) references ThuThu(MaThuThu),
	constraint FK_MADG foreign key(MaDocGia) references DocGia(MaDocGia)
)

create table Sach(
	MaSach int,
	TrangThai varchar(50),
	MaDauSach int,
	constraint PK_MaSach primary key(MaSach),
	constraint FK_MaDS foreign key(MaDauSach) references DauSach(MaDauSach)
)

create table MuonTra(
	MaSach int,
	MaPhieu int,
	SoLuong int,
	TienCocc int,
	MucViPham int,
	constraint PK_MuonTra primary key(MaSach, MaPhieu),
	constraint FK_MP foreign key(MaPhieu) references PhieuMuonTra(MaPhieu),
	constraint FK_MS foreign key(MaSach) references Sach(MaSach)
)