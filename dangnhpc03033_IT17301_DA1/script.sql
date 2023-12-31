USE [master]
GO
/****** Object:  Database [QuanLySuaDienThoai]    Script Date: 12/15/2022 3:43:08 PM ******/
CREATE DATABASE [QuanLySuaDienThoai]

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLySuaDienThoai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLySuaDienThoai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLySuaDienThoai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLySuaDienThoai] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLySuaDienThoai', N'ON'
GO
ALTER DATABASE [QuanLySuaDienThoai] SET QUERY_STORE = OFF
GO
USE [QuanLySuaDienThoai]
GO
/****** Object:  Table [dbo].[PhieuNhap_LinhKien]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap_LinhKien](
	[MaPhieuNhap] [nvarchar](5) NOT NULL,
	[MaLinhKien] [nvarchar](5) NULL,
	[TenLinhKien] [nvarchar](255) NULL,
	[SoLuong] [int] NOT NULL,
	[GiaTien] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[TongTienNhap]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TongTienNhap] (@MaPhieuNhap varchar(5))
RETURNS TABLE
AS 
RETURN (
    SELECT SUM(SoLuong * GiaTien) AS TongTien
FROM     dbo.PhieuNhap_LinhKien
WHERE  (MaPhieuNhap = @MaPhieuNhap)
GROUP BY MaPhieuNhap
)
GO
/****** Object:  Table [dbo].[Hang]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[MaHang] [nvarchar](5) NOT NULL,
	[TenHang] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Hang] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [nvarchar](5) NOT NULL,
	[TenKhachHang] [nvarchar](255) NOT NULL,
	[DiaChi] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[SoDienThoai] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[May]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[May](
	[MaMay] [nvarchar](5) NOT NULL,
	[TenMay] [nvarchar](255) NOT NULL,
	[MaHang] [nvarchar](5) NOT NULL,
	[Ram] [int] NULL,
	[Rom] [int] NULL,
	[Chip] [nvarchar](255) NULL,
 CONSTRAINT [PK_May] PRIMARY KEY CLUSTERED 
(
	[MaMay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [nvarchar](5) NOT NULL,
	[HoTen] [nvarchar](255) NOT NULL,
	[TaiKhoan] [nvarchar](255) NOT NULL,
	[MatKhau] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[SoDienThoai] [nvarchar](10) NOT NULL,
	[DiaChi] [nvarchar](255) NOT NULL,
	[Luong] [money] NOT NULL,
	[ChucVu] [nvarchar](255) NULL,
	[HinhAnh] [nvarchar](255) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuaChua]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuaChua](
	[MaSuaChua] [nvarchar](5) NOT NULL,
	[MaMay] [nvarchar](5) NOT NULL,
	[TinhTrangMay] [nvarchar](255) NULL,
	[MoTaLoi] [nvarchar](255) NULL,
	[MatKhauMay] [nvarchar](50) NULL,
	[MaKhachHang] [nvarchar](5) NOT NULL,
	[NgayNhanMay] [date] NOT NULL,
	[MaNhanVienNhanMay] [nvarchar](5) NOT NULL,
	[MaKyThuatVien] [nvarchar](5) NOT NULL,
	[PhiSuaChua] [money] NULL,
	[NgayTraMayDuKien] [date] NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
	[NgayNhanMayThucTe] [date] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_SuaChua] PRIMARY KEY CLUSTERED 
(
	[MaSuaChua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuaChua_LinhKien]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuaChua_LinhKien](
	[MaSuaChua] [nvarchar](5) NOT NULL,
	[MaLinhKien] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_SuaChua_LinhKien] PRIMARY KEY CLUSTERED 
(
	[MaSuaChua] ASC,
	[MaLinhKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinhKien]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinhKien](
	[MaLinhKien] [nvarchar](5) NOT NULL,
	[TenHang] [nvarchar](255) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [money] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_KhoHang] PRIMARY KEY CLUSTERED 
(
	[MaLinhKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT dbo.SuaChua.MaMay, dbo.SuaChua.MaNhanVienNhanMay, dbo.SuaChua.MaKyThuatVien, dbo.SuaChua.MaKhachHang, dbo.Hang.TenHang AS TenHangMay, dbo.May.TenMay, dbo.SuaChua.MoTaLoi, dbo.SuaChua.TinhTrangMay, 
                  dbo.SuaChua.MatKhauMay, dbo.SuaChua.NgayNhanMay, b.HoTen AS NhanVienNhanMay, a.HoTen AS KyThuatVien, dbo.SuaChua.PhiSuaChua, dbo.SuaChua.MoTa, dbo.SuaChua.NgayTraMayDuKien, dbo.SuaChua.TrangThai, 
                  dbo.SuaChua.NgayNhanMayThucTe, dbo.KhachHang.TenKhachHang, dbo.SuaChua.MaSuaChua, dbo.SuaChua_LinhKien.MaLinhKien, dbo.LinhKien.TenHang AS 'TenLinhKien'
FROM     dbo.SuaChua INNER JOIN
                  dbo.KhachHang ON dbo.KhachHang.MaKhachHang = dbo.SuaChua.MaKhachHang INNER JOIN
                  dbo.NhanVien AS a ON a.MaNhanVien = dbo.SuaChua.MaKyThuatVien INNER JOIN
                  dbo.May ON dbo.May.MaMay = dbo.SuaChua.MaMay INNER JOIN
                  dbo.SuaChua_LinhKien ON dbo.SuaChua.MaSuaChua = dbo.SuaChua_LinhKien.MaSuaChua LEFT OUTER JOIN
                  dbo.LinhKien ON dbo.SuaChua_LinhKien.MaLinhKien = dbo.LinhKien.MaLinhKien LEFT OUTER JOIN
                  dbo.NhanVien AS b ON b.MaNhanVien = dbo.SuaChua.MaNhanVienNhanMay LEFT OUTER JOIN
                  dbo.Hang ON dbo.Hang.MaHang = dbo.May.MaHang
GO
/****** Object:  UserDefinedFunction [dbo].[TongTienDua]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TongTienDua] (@MaSuaChua varchar(5))
RETURNS TABLE
AS 
RETURN  (
    SELECT sum(PhiSuaChua+LinhKien.GiaBan) as 'TongChiPhi',SuaChua.MaSuaChua
    FROM SuaChua inner join SuaChua_LinhKien on SuaChua.MaSuaChua=SuaChua_LinhKien.MaSuaChua inner join LinhKien on LinhKien.MaLinhKien=SuaChua_LinhKien.MaLinhKien
    WHERE SuaChua.MaSuaChua=SuaChua_LinhKien.MaSuaChua and SuaChua.MaSuaChua= @MaSuaChua
    GROUp BY SuaChua.MaSuaChua
)
GO
/****** Object:  Table [dbo].[BaoHanh]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoHanh](
	[MaSuaChua] [nvarchar](5) NOT NULL,
	[ThoiGianBaoHanh] [int] NOT NULL,
	[NgayBatDau] [date] NOT NULL,
 CONSTRAINT [PK_BaoHanh_1] PRIMARY KEY CLUSTERED 
(
	[MaSuaChua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/15/2022 3:43:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [nvarchar](5) NOT NULL,
	[MaSuaChua] [nvarchar](5) NOT NULL,
	[NgayLap] [date] NOT NULL,
	[ThanhTien] [money] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/15/2022 3:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [nvarchar](5) NOT NULL,
	[TenNhaCungCap] [nvarchar](255) NOT NULL,
	[DiaChi] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[SoDienThoai] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 12/15/2022 3:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [nvarchar](5) NOT NULL,
	[MaNhaCungCap] [nvarchar](5) NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[Mota] [nvarchar](255) NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BaoHanh] ([MaSuaChua], [ThoiGianBaoHanh], [NgayBatDau]) VALUES (N'MSC1', 12, CAST(N'2022-12-08' AS Date))
INSERT [dbo].[BaoHanh] ([MaSuaChua], [ThoiGianBaoHanh], [NgayBatDau]) VALUES (N'SC09', 12, CAST(N'2022-12-08' AS Date))
INSERT [dbo].[BaoHanh] ([MaSuaChua], [ThoiGianBaoHanh], [NgayBatDau]) VALUES (N'SC14', 12, CAST(N'2022-12-08' AS Date))
INSERT [dbo].[BaoHanh] ([MaSuaChua], [ThoiGianBaoHanh], [NgayBatDau]) VALUES (N'SC18', 12, CAST(N'2022-12-10' AS Date))
INSERT [dbo].[BaoHanh] ([MaSuaChua], [ThoiGianBaoHanh], [NgayBatDau]) VALUES (N'SC19', 9, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH01', N'APPLE')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH02', N'SAMSUNG')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH03', N'XIAOMI')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH04', N'VIVO')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH05', N'OPPO')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH06', N'HUAWEI')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH07', N'REALME')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH08', N'MOTOROLA')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH09', N'LENOVO')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH10', N'SONY')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH11', N'ASUS')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH12', N' BKAV')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH13', N'VSMART')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH14', N'LG')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MH15 ', N'BLACKBERRY')
GO
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaSuaChua], [NgayLap], [ThanhTien]) VALUES (N'HD1', N'SC09', CAST(N'2022-12-08' AS Date), 9350000.0000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaSuaChua], [NgayLap], [ThanhTien]) VALUES (N'HD2', N'MSC1', CAST(N'2022-12-08' AS Date), 9000000.0000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaSuaChua], [NgayLap], [ThanhTien]) VALUES (N'HD3', N'SC14', CAST(N'2022-12-08' AS Date), 7800000.0000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaSuaChua], [NgayLap], [ThanhTien]) VALUES (N'HD4', N'SC18', CAST(N'2022-12-10' AS Date), 3660000.0000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaSuaChua], [NgayLap], [ThanhTien]) VALUES (N'HD5', N'SC19', CAST(N'2022-12-12' AS Date), 1700000.0000)
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SoDienThoai]) VALUES (N'KH001', N'Nguyễn Đức Bình ', N'Cần Thơ ', N'kioyshi2003@gmail.com', N'0981725732')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SoDienThoai]) VALUES (N'KH002', N'Bùi Gia Thuận', N'Bình Minh ', N'buigiathuan@gmail.com', N'0932464921')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SoDienThoai]) VALUES (N'KH003', N'Bùi Anh Thư ', N'An Giang ', N'buianhthu@gmail.com', N'0782914928')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SoDienThoai]) VALUES (N'KH004', N'Đặng thị Bích Phụng ', N'Cần thơ', N'dangthibichphung@gmail.com', N'0389727159')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SoDienThoai]) VALUES (N'KH005', N'Lê Thiên Bảo', N'Cần Thơ ', N'lethienbao@gmail.com', N'0892759621')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SoDienThoai]) VALUES (N'KH006', N'Lê Dũng Anh ', N'Cần Thơ', N'ledunganh@gmail.com', N'0791979201')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SoDienThoai]) VALUES (N'KH007', N'Nguyễn Mạnh Hùng ', N'Cần Thơ', N'nguyenmanhhung@gmai.com', N'0792658209')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SoDienThoai]) VALUES (N'KH008', N'Nhâm Mạnh Dũng ', N'Cần Thơ ', N'nhammanhdung@gmail.com', N'0917582957')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [Email], [SoDienThoai]) VALUES (N'KH009', N'Phan Huy anh ', N'Hà Nội ', N'phanhuyanh@gmail.com', N'0792781924')
GO
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'LK121', N'Màn hình Vmart Active 3', 150, 350000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'LK14', N'Màn hình Vmart active 2', 119, NULL, NULL)
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK1', N'Màn hình Iphone 14 ', 97, 900000.0000, N'màn hình')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK10', N'Khung sườn, nắp lưng iPhone 13 zin new', 206, 500000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK11', N'Khung sườn, nắp lưng iPhone 14 zin new ', 290, 500000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK12', N'Khung sườn, nắp lưng iPhone 12 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 100, 6500000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK2', N' Cục rung iPhone XR', 199, 410000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK3', N'Loa trong iPhone X', 295, 520000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK4', N'Chân sạc Samsung Galaxy Z Fold4 5G ', 99, 40000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK5', N'Mặt lưng Samsung Galaxy S22 Ultra 5G ', 200, 1000000.0000, NULL)
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK6', N'Màn hình Apple Watch series 7 41mm full nguyên bộ zin máy', 99, 3500000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK7', N'Nút nguồn iPad 2', 97, 10000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK8', N'Vỏ iPad Mini 1, Wifi, không khắc chữ (Màu đen)', 446, 650000.0000, N'')
INSERT [dbo].[LinhKien] ([MaLinhKien], [TenHang], [SoLuong], [GiaBan], [MoTa]) VALUES (N'MLK9', N'Khung sườn, nắp lưng iPhone 13 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 545, 500000.0000, N'')
GO
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM1', N'iPhone 14', N'MH01', 8, 128, N'DRX 88')
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM10', N'Vivo V25 Pro ', N'MH04', 8, 128, N'D12')
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM11', N'Vivo Y22s', N'MH04', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM12', N'Vivo T1x ', N'MH04', 8, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM13 ', N'OPPO Find X5 Pro ', N'MH05', 8, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM14', N'OPPO Reno8 Pro', N'MH05', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM15', N'OPPO Reno7 Pro', N'MH05', 32, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM16', N'Huawei P30 Pro', N'MH06', 32, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM17', N'Huawei Nova 3i', N'MH06', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM18', N'Huawei Nova 3i 5G', N'MH06', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM19', N'Realme 9 Pro', N'MH07', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM2', N'iPhone XR', N'MH01', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM20', N'Realme 8 Pro', N'MH07', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM21', N'Realme 9i', N'MH07', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM22', N'Motorola Edge S30 5G', N'MH08', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM23', N'Motorola Moto Z Force', N'MH08', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM24', N'Motorola Moto G100', N'MH08', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM25', N'Lenovo Legion 2 Pro', N'MH09', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM26', N'LENOVO Z5S', N'MH09', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM27', N'Lenovo Z5 Pro', N'MH09', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM28 ', N'Sony Xperia 5 Mark III', N'MH10', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM29', N'Sony Xperia 1 IV', N'MH10', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM3', N'iPhone X', N'MH01', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM30', N'Asus ROG Phone 2', N'MH11', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM31', N'Bphone A85', N'MH12', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM32', N'Vsmart Aris', N'MH13', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM33', N'LG V50 ThinQ 5G', N'MH14', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM34', N'BlackBerry Key 2 Silver', N'MH15', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM35', N'Samsung Galaxy S23 Ultra 5G ', N'MH09', 16, 128, N'D11')
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM4', N'Samsung Galaxy Z Fold4 5G ', N'MH02', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM5', N'Samsung Galaxy S22 Ultra 5G ', N'MH02', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM6', N'Samsung Galaxy A04', N'MH02', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM7', N'Xiaomi Redmi A1 ', N'MH03', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM8', N'Xiaomi Redmi Note 11 Pro ', N'MH03', 16, 128, NULL)
INSERT [dbo].[May] ([MaMay], [TenMay], [MaHang], [Ram], [Rom], [Chip]) VALUES (N'MM9', N'Xiaomi Redmi 9A ', N'MH03', 16, 128, NULL)
GO
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [Email], [SoDienThoai]) VALUES (N'NCC01', N'Công ty linh kiện ', N'Cần Thơ ', N'ctlkcantho@gmail.com', N'0812346567')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [Email], [SoDienThoai]) VALUES (N'NCC02', N'ABECO ', N'HCM ', N'ABECO@gmail.com', N'0799758356')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [Email], [SoDienThoai]) VALUES (N'NCC03', N'Công ty cổ phần điện tử', N'HCM', N'nguyenphi@gmail.com', N'0943773774')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [Email], [SoDienThoai]) VALUES (N'NCC04', N'Công ty TNHH FC1', N'Đồng Nai ', N'huan@fujicopian.com.vn', N'0342534576')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [Email], [SoDienThoai]) VALUES (N'NCC05', N'Công ty TNHH Jing Goong 2', N'HCM ', N'jinggoong@hcm.vnn.vn', N'0928933138')
INSERT [dbo].[NhaCungCap] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [Email], [SoDienThoai]) VALUES (N'NCC06', N'Công ty linh kiện ', N'Cần Thơ ', N'ctlkcantho@gmail.com', N'0812346567')
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV01', N'Nguyễn Hồng Phương', N'phuongnhp2003', N'phuong123456', N'nguyenhongphuong.vn1@gmail.com', N'0788925658', N'Vĩnh Long', 10000000.0000, N'Quản Lý', N'a.png')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV02', N'Nguyễn Hải Đăng ', N'dangnhd2003', N'dang9999', N'nguyenhaidang@gmail.com', N'0986725732', N'Vĩnh Long', 8000000.0000, N'Nhân viên', N'a.png')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV03', N'Nguyễn Quốc Huy', N'huyrua123', N'Huyfpt345', N'nguyenquochuy@gmail.com', N'0928447427', N'Sóc trăng', 8000000.0000, N'Nhân viên', N'a.png')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV04', N'Vương Tấn Phát', N'phatbodoiqua789', N'phatquenmatkhau', N'vuongtanphat@gmail.com', N'0949070501', N'Bạc Liêu', 8000000.0000, N'Nhân viên', N'a.png')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV05', N'Võ Minh Hào', N'MinhHaou8', N'Hao23456', N'vominhao@gmail.com', N'0388211930', N'Đồng Tháp ', 8000000.0000, N'Nhân viên', N'1.png')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV06', N'Nguyễn Duy Khánh', N'Khanhdeptrai1', N'nguyenduykhanh2', N'nguyenduykhanh@gmail.com', N'0789452532', N'Cần Thơ', 8000000.0000, N'Nhân viên', NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV07', N'Huỳnh Tuấn Kiệt', N'kiet123123', N'123456', N'huynhtuankiet@gmail.com', N'0958296815', N'HCM', 9000000.0000, N'Nhân viên kỹ thuật', N'a.png')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV08', N'Nguyễn Văn Nghĩa ', N'nghiathichbaylac', N'nghia9090', N'nguyenvannghia@gmail.com', N'0762958239', N'Hậu Giang', 7500000.0000, N'Nhân viên kỹ thuật', N'a.png')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV09', N'Trương Phương Bình ', N'binhvotinh9', N'binh123456', N'truongphuongbinh@gmail.com', N'0963656601', N'Tiền Giang', 8000000.0000, N'Nhân viên kỹ thuật', N'a.png')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [TaiKhoan], [MatKhau], [Email], [SoDienThoai], [DiaChi], [Luong], [ChucVu], [HinhAnh]) VALUES (N'NV10', N'Đinh Việt Hoàng', N'hoanggymer', N'hoang123456', N'dinhviethoang@gmail.com', N'0788914668', N'Cần Thơ', 8000000.0000, N'Nhân viên kỹ thuật', N'a.png')
GO
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN01', N'NCC01', CAST(N'2022-02-02' AS Date), N'gdf')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN02', N'NCC01', CAST(N'2022-08-22' AS Date), N'hjg')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN03', N'NCC01', CAST(N'2022-07-12' AS Date), N'JKKF')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN04', N'NCC02', CAST(N'2022-07-12' AS Date), N'JFVK')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN05', N'NCC02', CAST(N'2022-07-12' AS Date), N'JKDFH')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN06', N'NCC02', CAST(N'2022-07-12' AS Date), N'EKJ')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN07', N'NCC03', CAST(N'2022-08-23' AS Date), N'ADJ')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN08', N'NCC04', CAST(N'2022-09-12' AS Date), N'JKSA')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN09', N'NCC04', CAST(N'2022-09-12' AS Date), N'JFKA')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN10', N'NCC05', CAST(N'2022-10-10' AS Date), N'DJKIG')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN11', N'NCC04', CAST(N'2022-09-12' AS Date), N'JFKA')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN12', N'NCC02', CAST(N'2022-09-12' AS Date), N'JFKA')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN13', N'NCC04', CAST(N'2022-09-12' AS Date), N'JFKA')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN14', N'NCC01', CAST(N'2022-12-10' AS Date), N'')
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [MaNhaCungCap], [NgayNhap], [Mota]) VALUES (N'PN15', N'NCC04', CAST(N'2022-12-10' AS Date), N'Nhập hàng công ty FC1')
GO
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN01', N'MLK1', N'Màn hình Iphone 14 ', 100, 900000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN02', N'MLK2', N' Cục rung iPhone XR', 100, 410000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN03', N'MLK3', N'Loa trong iPhone X', 100, 520000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN04', N'MLK4', N'Chân sạc Samsung Galaxy Z Fold4 5G ', 100, 40000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN05', N'MLK5', N'Mặt lưng Samsung Galaxy S22 Ultra 5G ', 100, 1000000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN06', N'MLK6', N'Màn hình Apple Watch series 7 41mm full nguyên bộ zin máy', 100, 3500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN07', N'MLK7', N'Nút nguồn iPad 2', 100, 10000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN08', N'MLK8', N'Vỏ iPad Mini 1, Wifi, không khắc chữ (Màu đen)', 100, 650000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN09', N'MLK9', N'Khung sườn, nắp lưng iPhone 13 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 100, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN09', N'MLK9', N'Khung sườn, nắp lưng iPhone 13 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 50, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN09', N'MLK9', N'Khung sườn, nắp lưng iPhone 13 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 150, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN10', N'MLK9', N'Khung sườn, nắp lưng iPhone 13 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 50, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN09', N'MLK10', N'Khung sườn, nắp lưng iPhone 13 zin new', 100, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN12', N'MLK9', N'Khung sườn, nắp lưng iPhone 13 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 100, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN12', N'MLK11', N'Khung sườn, nắp lưng iPhone 14 zin new ', 100, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN13', N'MLK8', N'Vỏ iPad Mini 1, Wifi, không khắc chữ (Màu đen)', 100, 6500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN08', N'MLK8', N'Vỏ iPad Mini 1, Wifi, không khắc chữ (Màu đen)', 50, 6500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN09', N'MLK3', N'Loa trong iPhone X', 100, 520000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN09', N'MLK12', N'Khung sườn, nắp lưng iPhone 12 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 100, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN13', N'MLK9', N'Khung sườn, nắp lưng iPhone 13 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 100, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN11', N'MLK10', N'Khung sườn, nắp lưng iPhone 13 zin new', 100, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN13', N'MLK3', N'Loa trong iPhone X', 100, 520000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN01', N'MLK9', N'Khung sườn, nắp lưng iPhone 13 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 100, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN04', N'MLK12', N'Khung sườn, nắp lưng iPhone 12 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 90, 6500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN05', N'MLK11', N'Khung sườn, nắp lưng iPhone 14 zin new ', 100, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN07', N'MLK2', N' Cục rung iPhone XR', 100, 120000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN05', N'LK121', N'Màn hình Vmart Active 3', 100, 350000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN02', N'LK121', N'Màn hình Vmart Active 3', 10, 350000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN09', N'LK121', N'Màn hình Vmart Active 3', 50, 300000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN15', N'MLK12', N'Khung sườn, nắp lưng iPhone 12 zin new (Màu trắng, đen, đỏ, xanh, xanh lá, vàng, hồng)', 9, 500000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN15', N'LK14', N'Màn hình Vmart active 2', 120, 350000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN10', N'MLK10', N'Khung sườn, nắp lưng iPhone 13 zin new', 10, 3000000.0000)
INSERT [dbo].[PhieuNhap_LinhKien] ([MaPhieuNhap], [MaLinhKien], [TenLinhKien], [SoLuong], [GiaTien]) VALUES (N'PN14', N'MLK2', N' Cục rung iPhone XR', 1, 3000000.0000)
GO
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'MSC1', N'MM1', N'Hư màn hình', N'Cần thay màn hình ', N'999999', N'KH001', CAST(N'2022-01-30' AS Date), N'NV07', N'NV07', 150000.0000, CAST(N'2022-01-31' AS Date), N'Đã giao máy', CAST(N'1900-01-01' AS Date), N'thay màn hình')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'MSC10', N'MM1', N'Cần thay màn hình và kiểm tra hoạt động của máy', N'Hư màn hình', N'', N'KH005', CAST(N'2022-04-12' AS Date), N'NV01', N'NV08', 150000.0000, CAST(N'2022-04-22' AS Date), N'Đã Nhận', CAST(N'2022-12-04' AS Date), N'150K:Phí thay màn hình')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'MSC2', N'MM2', N'Còn mới hơi trầy nhẹ', N'Thay cục rung iPhone XR', N'000000', N'KH002', CAST(N'2022-01-23' AS Date), N'NV02', N'NV08', 50000.0000, CAST(N'2022-01-25' AS Date), N'Đã Nhận', CAST(N'1900-01-01' AS Date), N'thay pin')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'MSC3', N'MM3', N'Máy đã thay màn hình', N'Thay loa trong iPhone X', N'111111', N'KH003', CAST(N'2022-02-15' AS Date), N'NV02', N'NV09', 100000.0000, CAST(N'2022-02-20' AS Date), N'Đã Nhận', CAST(N'1900-01-01' AS Date), N'thay loa')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'MSC4', N'MM4', N'Máy zin new', N'Hư chân sạc thay cần thay chân sạc', N'888888', N'KH004', CAST(N'2022-05-19' AS Date), N'NV05', N'NV10', 20000.0000, CAST(N'2022-05-21' AS Date), N'Đã Nhận', CAST(N'1900-01-01' AS Date), N'thay chân sạc')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'MSC5', N'MM5', N'Máy mới ', N'Mặt lưng vỡ cần thay mới mặt lưng', N'123456', N'KH005', CAST(N'2022-03-01' AS Date), N'NV02', N'NV08', 100000.0000, CAST(N'2022-03-10' AS Date), N'Đã Nhận', CAST(N'1900-01-01' AS Date), N'thay mặt lưng')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'MSC6', N'MM3', N'Máy đã thay màn hình', N'Thay loa trong iPhone X', N'111111', N'KH003', CAST(N'2022-02-15' AS Date), N'NV02', N'NV09', 100000.0000, CAST(N'2022-02-20' AS Date), N'Đã Nhận', CAST(N'1900-01-01' AS Date), N'thay loa')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'MSC7', N'MM3', N'Máy đã thay màn hình', N'Thay loa trong iPhone X', N'111111', N'KH003', CAST(N'2022-02-17' AS Date), N'NV02', N'NV09', 100000.0000, CAST(N'2022-02-20' AS Date), N'Đã Nhận', CAST(N'2022-02-19' AS Date), N'thay loa')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC08', N'MM1', N'Cần thay loa', N'Hư loa	', N'', N'KH004', CAST(N'2022-04-12' AS Date), N'NV01', N'NV08', 300000.0000, CAST(N'2022-04-20' AS Date), N'Đã Nhận', CAST(N'2022-12-04' AS Date), N'Thay pin:300k')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC09', N'MM1', N'Thay màn hình', N'Thay màn hình', N'', N'KH004', CAST(N'2022-04-12' AS Date), N'NV07', N'NV07', 300000.0000, CAST(N'2022-04-20' AS Date), N'Đã giao máy', CAST(N'2022-04-20' AS Date), N'tháo máy+thay:125k
Kiểm tra máy:150k
Phí thay:75k')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC10', N'MM1', N'Cần thay màn hình', N'Hư màn hình', N'123', N'KH009', CAST(N'2022-04-12' AS Date), N'NV07', N'NV07', 150000.0000, CAST(N'2022-04-20' AS Date), N'Đã Sửa', CAST(N'2022-12-04' AS Date), N'150k:Phí thay màn hình')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC11', N'MM1', N'Cần thay màn hình', N'Hư màn hình', N'', N'KH005', CAST(N'2022-04-12' AS Date), N'NV01', N'NV08', 150000.0000, CAST(N'2022-04-20' AS Date), N'Đã Nhận', CAST(N'2022-12-04' AS Date), N'150k:Phí thay mành hình')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC12', N'MM3', N'Lỗi của loa', N'Lỗi loa+Kiểm tra máy', N'123456', N'KH008', CAST(N'2022-12-05' AS Date), N'NV01', N'NV07', 150000.0000, CAST(N'2022-04-10' AS Date), N'Đã Nhận', CAST(N'2022-12-05' AS Date), N'Thay loa trong 150k')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC13', N'MM1', NULL, NULL, NULL, N'KH008', CAST(N'2022-04-06' AS Date), N'NV01', N'NV07', NULL, NULL, N'Đã Sửa', NULL, NULL)
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC14', N'MM1', N'gdgdgd', N'fsdfsdf', N'', N'KH001', CAST(N'2022-12-08' AS Date), N'NV01', N'NV07', 100000.0000, CAST(N'2022-12-10' AS Date), N'Đã giao máy', CAST(N'2022-12-08' AS Date), N'gdgdf')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC16', N'MM1', N'Kiểm tra và thay màn hình', N'Hư màn hình', N'', N'KH001', CAST(N'2022-12-09' AS Date), N'NV01', N'NV07', 300000.0000, CAST(N'2022-12-10' AS Date), N'Đã Sửa', CAST(N'2022-12-10' AS Date), N'')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC17', N'MM1', N'Cần kiểm tra máy', N'Hư màn hình', N'', N'KH004', CAST(N'2022-12-10' AS Date), N'NV01', N'NV07', NULL, CAST(N'2022-12-11' AS Date), N'Đã Nhận', CAST(N'2022-12-11' AS Date), NULL)
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC18', N'MM1', N'Cần kiểm tra ', N'Máy hư màn hình', N'', N'KH001', CAST(N'2022-12-10' AS Date), N'NV07', N'NV07', 300000.0000, CAST(N'2022-12-10' AS Date), N'Đã giao máy', CAST(N'2022-12-10' AS Date), N'300.000:Phí sửa ')
INSERT [dbo].[SuaChua] ([MaSuaChua], [MaMay], [TinhTrangMay], [MoTaLoi], [MatKhauMay], [MaKhachHang], [NgayNhanMay], [MaNhanVienNhanMay], [MaKyThuatVien], [PhiSuaChua], [NgayTraMayDuKien], [TrangThai], [NgayNhanMayThucTe], [MoTa]) VALUES (N'SC19', N'MM1', N'Cần kiểm tra', N'Hư máy', N'', N'KH001', CAST(N'2022-12-12' AS Date), N'NV07', N'NV07', 150000.0000, CAST(N'2022-12-13' AS Date), N'Đã giao máy', CAST(N'2022-12-12' AS Date), N'')
GO
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'MSC10', N'MLK11')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'MSC10', N'MLK6')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'MSC5', N'MLK11')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'SC10', N'MLK4')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'SC13', N'MLK7')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'SC13', N'MLK8')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'SC13', N'MLK9')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'SC16', N'MLK1')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'SC16', N'MLK11')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'SC18', N'MLK8')
INSERT [dbo].[SuaChua_LinhKien] ([MaSuaChua], [MaLinhKien]) VALUES (N'SC18', N'MLK9')
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_SuaChua] FOREIGN KEY([MaSuaChua])
REFERENCES [dbo].[SuaChua] ([MaSuaChua])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_SuaChua]
GO
ALTER TABLE [dbo].[May]  WITH CHECK ADD  CONSTRAINT [FK_May_Hang1] FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
GO
ALTER TABLE [dbo].[May] CHECK CONSTRAINT [FK_May_Hang1]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[SuaChua]  WITH CHECK ADD  CONSTRAINT [FK_SuaChua_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[SuaChua] CHECK CONSTRAINT [FK_SuaChua_KhachHang]
GO
ALTER TABLE [dbo].[SuaChua]  WITH CHECK ADD  CONSTRAINT [FK_SuaChua_May] FOREIGN KEY([MaMay])
REFERENCES [dbo].[May] ([MaMay])
GO
ALTER TABLE [dbo].[SuaChua] CHECK CONSTRAINT [FK_SuaChua_May]
GO
ALTER TABLE [dbo].[SuaChua]  WITH CHECK ADD  CONSTRAINT [FK_SuaChua_NhanVien] FOREIGN KEY([MaNhanVienNhanMay])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[SuaChua] CHECK CONSTRAINT [FK_SuaChua_NhanVien]
GO
ALTER TABLE [dbo].[SuaChua]  WITH CHECK ADD  CONSTRAINT [FK_SuaChua_NhanVien1] FOREIGN KEY([MaKyThuatVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[SuaChua] CHECK CONSTRAINT [FK_SuaChua_NhanVien1]
GO
ALTER TABLE [dbo].[SuaChua_LinhKien]  WITH CHECK ADD  CONSTRAINT [FK_SuaChua_LinhKien_LinhKien] FOREIGN KEY([MaLinhKien])
REFERENCES [dbo].[LinhKien] ([MaLinhKien])
GO
ALTER TABLE [dbo].[SuaChua_LinhKien] CHECK CONSTRAINT [FK_SuaChua_LinhKien_LinhKien]
GO
ALTER TABLE [dbo].[SuaChua_LinhKien]  WITH CHECK ADD  CONSTRAINT [FK_SuaChua_LinhKien_SuaChua] FOREIGN KEY([MaSuaChua])
REFERENCES [dbo].[SuaChua] ([MaSuaChua])
GO
ALTER TABLE [dbo].[SuaChua_LinhKien] CHECK CONSTRAINT [FK_SuaChua_LinhKien_SuaChua]
GO
/****** Object:  StoredProcedure [dbo].[SP_DoanhThu]    Script Date: 12/15/2022 3:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DoanhThu]
AS
BEGIN
SELECT CONVERT(varchar, NgayNhap, 103) AS 'Ngay',N'Nhập '+TenLinhKien AS 'Noi dung',(GiaTien*SoLuong) AS 'TongTien','chi' as 'trạng thái' FROM dbo.PhieuNhap INNER JOIN dbo.PhieuNhap_LinhKien ON PhieuNhap_LinhKien.MaPhieuNhap = PhieuNhap.MaPhieuNhap
UNION
SELECT CONVERT(varchar,NgayLap, 103) AS 'Ngay',N'Dùng '+TenHang AS 'Noi dung',ThanhTien AS 'TongTien','thu' as 'trạng thái' FROM dbo.HoaDon INNER JOIN dbo.SuaChua ON SuaChua.MaSuaChua = HoaDon.MaSuaChua INNER JOIN dbo.SuaChua_LinhKien ON SuaChua_LinhKien.MaSuaChua = SuaChua.MaSuaChua inner join LinhKien on SuaChua_LinhKien.MaLinhKien = LinhKien.MaLinhKien
ORDER BY Ngay
RETURN
END
EXEC dbo.SP_DoanhThu
GO
/****** Object:  StoredProcedure [dbo].[SP_LuongNV]    Script Date: 12/15/2022 3:43:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LuongNV]
AS
BEGIN
SELECT HoTen,Luong,ChucVu FROM dbo.NhanVien
RETURN
END
EXEC dbo.SP_LuongNV
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PhieuNhap_LinhKien', @level2type=N'COLUMN',@level2name=N'GiaTien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[3] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SuaChua"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 291
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KhachHang"
            Begin Extent = 
               Top = 7
               Left = 339
               Bottom = 170
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 7
               Left = 582
               Bottom = 170
               Right = 776
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "May"
            Begin Extent = 
               Top = 7
               Left = 824
               Bottom = 170
               Right = 1018
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SuaChua_LinhKien"
            Begin Extent = 
               Top = 194
               Left = 535
               Bottom = 313
               Right = 729
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LinhKien"
            Begin Extent = 
               Top = 140
               Left = 1134
               Bottom = 303
               Right = 1328
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 7
               Left = 1308
               Bottom = 170
               Right = 1502
            End
            DisplayFlags = 280
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         TopColumn = 0
         End
         Begin Table = "Hang"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 294
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 22
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2016
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [QuanLySuaDienThoai] SET  READ_WRITE 
GO
