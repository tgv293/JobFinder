USE [master]
GO
/****** Object:  Database [Project_63135353]    Script Date: 12/30/2023 8:12:11 PM ******/
CREATE DATABASE [Project_63135353]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_63135353', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Project_63135353.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_63135353_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Project_63135353_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Project_63135353] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_63135353].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_63135353] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_63135353] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_63135353] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_63135353] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_63135353] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_63135353] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_63135353] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_63135353] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_63135353] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_63135353] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_63135353] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_63135353] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_63135353] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_63135353] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_63135353] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project_63135353] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_63135353] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_63135353] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_63135353] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_63135353] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_63135353] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_63135353] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_63135353] SET RECOVERY FULL 
GO
ALTER DATABASE [Project_63135353] SET  MULTI_USER 
GO
ALTER DATABASE [Project_63135353] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_63135353] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_63135353] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_63135353] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_63135353] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_63135353] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project_63135353', N'ON'
GO
ALTER DATABASE [Project_63135353] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project_63135353] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project_63135353]
GO
/****** Object:  Table [dbo].[CompanyTable]    Script Date: 12/30/2023 8:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyTable](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CompanyName] [nvarchar](500) NOT NULL,
	[PhoneNo] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](500) NOT NULL,
	[Logo] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_CompanyTable] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobCategoryTable]    Script Date: 12/30/2023 8:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobCategoryTable](
	[JobCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[JobCategory] [nvarchar](350) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_JobCategoryTable] PRIMARY KEY CLUSTERED 
(
	[JobCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobNatureTable]    Script Date: 12/30/2023 8:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobNatureTable](
	[JobNatureID] [int] IDENTITY(1,1) NOT NULL,
	[JobNature] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_JobNatureTable] PRIMARY KEY CLUSTERED 
(
	[JobNatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobRequirementDetailTable]    Script Date: 12/30/2023 8:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobRequirementDetailTable](
	[JobRequirementDetailID] [int] IDENTITY(1,1) NOT NULL,
	[JobRequirementID] [int] NOT NULL,
	[JobRequirementDetail] [nvarchar](2000) NOT NULL,
	[PostJobID] [int] NOT NULL,
 CONSTRAINT [PK_JobRequirementDetailTable] PRIMARY KEY CLUSTERED 
(
	[JobRequirementDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobRequirementTable]    Script Date: 12/30/2023 8:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobRequirementTable](
	[JobRequirementID] [int] IDENTITY(1,1) NOT NULL,
	[JobRequirementTitle] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_JobRequirementTable] PRIMARY KEY CLUSTERED 
(
	[JobRequirementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobStatusTable]    Script Date: 12/30/2023 8:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobStatusTable](
	[JobStatusID] [int] IDENTITY(1,1) NOT NULL,
	[JobStatus] [nvarchar](150) NOT NULL,
	[StatusMessage] [nvarchar](2000) NULL,
 CONSTRAINT [PK_JobStatusTable] PRIMARY KEY CLUSTERED 
(
	[JobStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostJobTable]    Script Date: 12/30/2023 8:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostJobTable](
	[PostJobID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[JobCategoryID] [int] NOT NULL,
	[JobTitle] [nvarchar](500) NOT NULL,
	[JobDescription] [nvarchar](2000) NOT NULL,
	[MinSalary] [int] NOT NULL,
	[MaxSalary] [int] NOT NULL,
	[Location] [nvarchar](500) NOT NULL,
	[Vacancy] [int] NOT NULL,
	[JobNatureID] [int] NOT NULL,
	[PostDate] [date] NOT NULL,
	[ApplicationLastDate] [date] NOT NULL,
	[JobStatusID] [int] NOT NULL,
	[WebUrl] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_PostJobTable] PRIMARY KEY CLUSTERED 
(
	[PostJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 12/30/2023 8:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeTable]    Script Date: 12/30/2023 8:12:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeTable](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_UserTypeTable] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyTable]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[CompanyTable] CHECK CONSTRAINT [FK_CompanyTable_UserTable]
GO
ALTER TABLE [dbo].[JobRequirementDetailTable]  WITH CHECK ADD  CONSTRAINT [FK_JobRequirementDetailTable_JobRequirementTable] FOREIGN KEY([JobRequirementID])
REFERENCES [dbo].[JobRequirementTable] ([JobRequirementID])
GO
ALTER TABLE [dbo].[JobRequirementDetailTable] CHECK CONSTRAINT [FK_JobRequirementDetailTable_JobRequirementTable]
GO
ALTER TABLE [dbo].[JobRequirementDetailTable]  WITH CHECK ADD  CONSTRAINT [FK_JobRequirementDetailTable_PostJobTable] FOREIGN KEY([PostJobID])
REFERENCES [dbo].[PostJobTable] ([PostJobID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobRequirementDetailTable] CHECK CONSTRAINT [FK_JobRequirementDetailTable_PostJobTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_CompanyTable] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[CompanyTable] ([CompanyID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_CompanyTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobCategoryTable] FOREIGN KEY([JobCategoryID])
REFERENCES [dbo].[JobCategoryTable] ([JobCategoryID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobCategoryTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobNatureTable] FOREIGN KEY([JobNatureID])
REFERENCES [dbo].[JobNatureTable] ([JobNatureID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobNatureTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobStatusTable] FOREIGN KEY([JobStatusID])
REFERENCES [dbo].[JobStatusTable] ([JobStatusID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobStatusTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_UserTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_UserTypeTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_UserTypeTable]
GO
USE [master]
GO
ALTER DATABASE [Project_63135353] SET  READ_WRITE 
GO
USE Project_63135353
GO
-- Adding values to JobNatureTable
INSERT INTO [dbo].[JobNatureTable] ([JobNature])
VALUES 
    (N'Full Time'),
    (N'Part Time'),
    (N'Remote');
GO
-- Adding values to JobRequirementTable
INSERT INTO [dbo].[JobRequirementTable] ([JobRequirementTitle])
VALUES 
    (N'Kinh nghiệm làm việc'),
    (N'Kỹ năng'),
    (N'Học vấn'),
    (N'Giấy phép và chứng chỉ chuyên nghiệp'),
    (N'Kiến thức cụ thể'),
    (N'Đặc điểm cá nhân và phẩm chất'),
    (N'Ngôn ngữ'),
    (N'Khả năng về thể chất'),
    (N'Kiến thức, kỹ năng và năng lực cần có'),
    (N'Giáo Dục + Kinh Nghiệm');
GO
-- Adding values to JobStatusTable
INSERT INTO [dbo].[JobStatusTable] ([JobStatus], [StatusMessage])
VALUES 
    (N'Chờ duyệt', N'Bài đăng đang được xem xét, mất 24 giờ'),
    (N'Chấp thuận', N'Chúc mừng, công việc đã được duyệt'),
    (N'Từ chối', N'Yêu cầu của bạn không phù hợp với Job');
GO
-- Adding values to UserTypeTable
INSERT INTO [dbo].[UserTypeTable] ([UserType])
VALUES 
    (N'Admin'),
    (N'Nhà tuyển dụng'),
    (N'Người tìm việc');
GO
-- Adding values to JobCategoryTable
INSERT INTO [dbo].[JobCategoryTable] ([JobCategory], [Description])
VALUES 
    (N'Technology', N'Công việc liên quan đến công nghệ và IT'),
    (N'Finance', N'Công việc trong lĩnh vực tài chính'),
    (N'Marketing', N'Công việc liên quan đến tiếp thị và quảng cáo'),
    (N'Healthcare', N'Công việc trong ngành chăm sóc sức khỏe'),
    (N'Education', N'Công việc trong lĩnh vực giáo dục'),
    (N'Engineering', N'Công việc trong lĩnh vực kỹ thuật và xây dựng'),
    (N'Hospitality', N'Công việc trong ngành du lịch và dịch vụ khách sạn'),
    (N'Retail', N'Công việc trong lĩnh vực bán lẻ và bán hàng'),
    (N'Human Resources', N'Công việc trong lĩnh vực nhân sự và quản lý nhân sự'),
    (N'Manufacturing', N'Công việc trong lĩnh vực sản xuất và chế tạo'),
    (N'Customer Service', N'Công việc trong lĩnh vực chăm sóc khách hàng và hỗ trợ'),
    (N'Legal', N'Công việc trong lĩnh vực pháp lý'),
    (N'Art and Design', N'Công việc trong lĩnh vực nghệ thuật, thiết kế và sáng tạo'),
    (N'Science', N'Công việc trong nghiên cứu và phát triển khoa học'),
    (N'Social Services', N'Công việc trong các dịch vụ xã hội và tổ chức phi lợi nhuận'),
    (N'Architecture', N'Công việc trong lĩnh vực kiến trúc và quy hoạch'),
    (N'Agriculture', N'Công việc trong nông nghiệp và chăn nuôi'),
    (N'Energy', N'Công việc trong ngành năng lượng và tiện ích'),
    (N'Media and Journalism', N'Công việc trong truyền thông, báo chí và giao tiếp'),
    (N'Telecommunications', N'Công việc trong ngành viễn thông'),
    (N'Automotive', N'Công việc trong ngành công nghiệp ô tô'),
    (N'Aerospace', N'Công việc trong lĩnh vực hàng không và vũ trụ'),
    (N'Fashion', N'Công việc trong ngành thời trang và sản xuất quần áo'),
    (N'Sports and Recreation', N'Công việc trong lĩnh vực thể thao và giải trí'),
    (N'Pharmaceutical', N'Công việc trong ngành dược và nghiên cứu y tế'),
    (N'Consulting', N'Công việc trong lĩnh vực tư vấn và dịch vụ tư vấn'),
    (N'Government', N'Công việc trong lĩnh vực chính phủ và quản lý công cộng'),
    (N'Entertainment', N'Công việc trong lĩnh vực giải trí và sản xuất truyền thông'),
    (N'Insurance', N'Công việc trong ngành bảo hiểm'),
    (N'Architecture', N'Công việc trong lĩnh vực kiến trúc và quy hoạch');
GO
-- Thêm một bản ghi mới vào bảng UserTable với mật khẩu theo yêu cầu
INSERT INTO [dbo].[UserTable] ([UserTypeID], [UserName], [Password], [EmailAddress], [ContactNo])
VALUES 
    (1, 'AdminUser', 'P@ssw0rd', 'admin@example.com', '1234567890'),
	(2, 'EmployerUser', 'Emp@ss123', 'employer@example.com', '9876543210'),
	(3, 'JobSeekerUser', 'JobS@ek456', 'jobseeker@example.com', '1231234567');
GO
-- Thêm một bản ghi mới cho Nhà tuyển dụng trong bảng CompanyTable
INSERT INTO [dbo].[CompanyTable] ([UserID], [CompanyName], [PhoneNo], [EmailAddress], [Logo], [Description])
VALUES 
    (2, 'ABC Corporation', '123-456-7890', 'employer@abccorp.com', 'path_to_logo.jpg', 'Description for ABC Corporation');
GO
-- Inserting 10 job postings into PostJobTable
INSERT INTO [dbo].[PostJobTable] (
    [UserID],
    [CompanyID],
    [JobCategoryID],
    [JobTitle],
    [JobDescription],
    [MinSalary],
    [MaxSalary],
    [Location],
    [Vacancy],
    [JobNatureID],
    [PostDate],
    [ApplicationLastDate],
    [JobStatusID],
    [WebUrl]
)
VALUES 
    (2, 1, 1, N'Kỹ sư Phần mềm', N'Tuyển dụng Kỹ sư Phần mềm có kinh nghiệm để phát triển các giải pháp phần mềm sáng tạo.', 70000, 90000, N'Hà Nội', 5, 1, '2023-12-28', '2024-01-15', 2, 'https://example.com/software-engineer'),
    
    (2, 1, 2, N'Nhà phân tích tài chính', N'Tham gia đội tài chính của chúng tôi với vai trò Nhà phân tích tài chính để phân tích dữ liệu tài chính và hỗ trợ quyết định.', 60000, 80000, N'Hồ Chí Minh', 3, 2, '2023-12-29', '2024-01-20', 2, 'https://example.com/financial-analyst'),
    
    (2, 1, 3, N'Chuyên viên Tiếp thị', N'Chúng tôi đang tìm kiếm Chuyên viên Tiếp thị để tạo và triển khai chiến lược tiếp thị.', 50000, 70000, N'Hải Phòng', 4, 3, '2023-12-30', '2024-01-25', 2, 'https://example.com/marketing-specialist'),
    
    (2, 1, 4, N'Y tá Đăng ký', N'Tham gia đội chăm sóc sức khỏe của chúng tôi với vai trò Y tá Đăng ký để cung cấp chăm sóc chất lượng cao cho bệnh nhân.', 65000, 85000, N'Cần Thơ', 2, 1, '2023-12-31', '2024-01-30', 2, 'https://example.com/registered-nurse'),
    
    (2, 1, 5, N'Chuyên viên Tổ chức Giáo dục', N'Tìm kiếm Chuyên viên Tổ chức Giáo dục để quản lý các chương trình và sáng kiến giáo dục.', 55000, 75000, N'Đà Nẵng', 3, 2, '2024-01-01', '2024-02-05', 2, 'https://example.com/education-coordinator'),
    
    (2, 1, 6, N'Kỹ sư Xây dựng', N'Tham gia đội kỹ sư của chúng tôi với vai trò Kỹ sư Xây dựng để thiết kế và giám sát các dự án xây dựng.', 70000, 90000, N'Hải Dương', 2, 1, '2024-01-02', '2024-02-10', 2, 'https://example.com/civil-engineer'),
    
    (2, 1, 7, N'Quản lý Khách sạn', N'Chúng tôi đang tuyển Quản lý Khách sạn để giám sát các hoạt động hàng ngày của khách sạn và đảm bảo sự hài lòng của khách hàng.', 60000, 80000, N'Hồ Chí Minh', 2, 1, '2024-01-03', '2024-02-15', 1, 'https://example.com/hotel-manager'),
    
    (2, 1, 8, N'Nhân viên Bán hàng Bán lẻ', N'Tham gia đội bán lẻ của chúng tôi với vai trò Nhân viên Bán hàng để cung cấp dịch vụ khách hàng xuất sắc và thúc đẩy doanh số bán hàng.', 45000, 65000, N'Hải Phòng', 4, 3, '2024-01-04', '2024-02-20', 1, 'https://example.com/retail-sales-associate'),
    
    (2, 1, 9, N'Chuyên viên Nhân sự', N'Tìm kiếm Chuyên viên Nhân sự để xử lý các chức năng Nhân sự và hỗ trợ quan hệ nhân viên.', 55000, 75000, N'Đà Nẵng', 3, 2, '2024-01-05', '2024-02-25', 1, 'https://example.com/hr-specialist'),
    
    (2, 1, 10, N'Kỹ thuật viên Sản xuất', N'Tham gia đội sản xuất của chúng tôi với vai trò Kỹ thuật viên để vận hành và duy trì thiết bị sản xuất.', 50000, 70000, N'Hà Nội', 2, 1, '2024-01-06', '2024-03-01', 1, 'https://example.com/manufacturing-technician'),
	
	(2, 1, 1, N'Phát triển Frontend', N'Tham gia đội của chúng tôi với vai trò Phát triển Frontend để tạo ra giao diện web phản hồi và thân thiện với người dùng.', 65000, 85000, N'Hồ Chí Minh', 3, 1, '2024-01-07', '2024-03-05', 1, 'https://example.com/frontend-developer'),
    
    (2, 1, 2, N'Nhà phân tích Đầu tư', N'Tìm kiếm Nhà phân tích Đầu tư để phân tích thị trường tài chính và đề xuất chiến lược đầu tư.', 70000, 90000, N'Hải Dương', 2, 1, '2024-01-08', '2024-03-10', 1, 'https://example.com/investment-analyst'),
    
    (2, 1, 3, N'Quản lý Truyền thông Xã hội', N'Chúng tôi đang tuyển Quản lý Truyền thông Xã hội để phát triển và triển khai các chiến dịch tiếp thị truyền thông xã hội.', 55000, 75000, N'Hồ Chí Minh', 4, 3, '2024-01-09', '2024-03-15', 1, 'https://example.com/social-media-manager'),
    
    (2, 1, 4, N'Trợ lý Bác sĩ', N'Tham gia đội chăm sóc sức khỏe của chúng tôi với vai trò Trợ lý Bác sĩ để cung cấp chăm sóc y tế và hỗ trợ trong phẫu thuật.', 80000, 100000, N'Hà Nội', 1, 1, '2024-01-10', '2024-03-20', 1, 'https://example.com/physician-assistant'),
    
    (2, 1, 5, N'Chuyên viên Tổ chức Giáo dục', N'Tìm kiếm Chuyên viên Tổ chức Giáo dục để lên kế hoạch và phối hợp các chương trình giáo dục cho sinh viên.', 60000, 80000, N'Đà Nẵng', 3, 2, '2024-01-11', '2024-03-25', 1, 'https://example.com/educational-coordinator'),

    (2, 1, 6, N'Kỹ sư Cơ khí', N'Chúng tôi đang tuyển Kỹ sư Cơ khí để thiết kế và phát triển hệ thống cơ khí và sản phẩm.', 75000, 95000, N'Hà Nội', 2, 1, '2024-01-12', '2024-03-30', 1, 'https://example.com/mechanical-engineer'),
    
    (2, 1, 7, N'Quản lý Nhà hàng', N'Tham gia đội của chúng tôi với vai trò Quản lý Nhà hàng để giám sát hoạt động hàng ngày của nhà hàng và đảm bảo sự hài lòng của khách hàng.', 50000, 70000, N'Hồ Chí Minh', 2, 1, '2024-01-13', '2024-04-05', 1, 'https://example.com/restaurant-manager'),
    
	(2, 1, 8, N'Nhân viên Bán hàng', N'Chúng tôi đang tuyển Nhân viên Bán hàng để quảng bá và bán sản phẩm hoặc dịch vụ của chúng tôi.', 45000, 65000, N'Đà Nẵng', 4, 3, '2024-01-14', '2024-04-10', 1, 'https://example.com/sales-representative'),
    
    (2, 1, 9, N'Chuyên viên Tuyển dụng', N'Tìm kiếm Chuyên viên Tuyển dụng để quản lý quy trình tuyển dụng và thu hút ứng viên đủ điều kiện.', 60000, 80000, N'Hải Dương', 3, 2, '2024-01-15', '2024-04-15', 1, 'https://example.com/recruitment-specialist'),
    
    (2, 1, 10, N'Kỹ thuật viên Kiểm soát Chất lượng', N'Tham gia đội sản xuất của chúng tôi với vai trò Kỹ thuật viên Kiểm soát Chất lượng để đảm bảo chất lượng sản phẩm và tuân thủ.', 55000, 75000, N'Hồ Chí Minh', 2, 1, '2024-01-16', '2024-04-20', 1, 'https://example.com/quality-control-technician'),

	(2, 1, 1, N'Thiết kế UX/UI', N'Chúng tôi đang tìm kiếm một Nhà thiết kế UX/UI tài năng để tạo giao diện hấp dẫn và thân thiện với người dùng.', 70000, 90000, N'Hà Nội', 3, 1, '2024-01-17', '2024-04-25', 1, 'https://example.com/ux-ui-designer'),
    
    (2, 1, 2, N'Nhà phân tích Rủi ro', N'Tham gia đội tài chính của chúng tôi với vai trò Nhà phân tích Rủi ro để đánh giá và giảm thiểu rủi ro tài chính tiềm ẩn.', 65000, 85000, N'Hải Dương', 2, 1, '2024-01-18', '2024-05-01', 1, 'https://example.com/risk-analyst'),
    
    (2, 1, 3, N'Chuyên gia Tiếp thị Nội dung', N'Tìm kiếm Chuyên gia Tiếp thị Nội dung để tạo nội dung hấp dẫn và thuyết phục cho các chiến dịch tiếp thị của chúng tôi.', 55000, 75000, N'Hồ Chí Minh', 4, 3, '2024-01-19', '2024-05-05', 1, 'https://example.com/content-marketing-specialist'),
    
    (2, 1, 4, N'Chuyên gia nha khoa', N'Tham gia đội nha khoa của chúng tôi với vai trò Chuyên gia nha khoa để cung cấp dịch vụ chăm sóc nha khoa phòng ngừa cho bệnh nhân.', 60000, 80000, N'Hồ Chí Minh', 1, 1, '2024-01-20', '2024-05-10', 1, 'https://example.com/dental-hygienist'),
    
    (2, 1, 5, N'Chuyên viên Tổ chức Học trực tuyến', N'Tìm kiếm Chuyên viên Tổ chức Học trực tuyến để phát triển và quản lý các chương trình giáo dục trực tuyến cho tổ chức của chúng tôi.', 50000, 70000, N'Hà Nội', 3, 2, '2024-01-21', '2024-05-15', 1, 'https://example.com/e-learning-coordinator'),
    
    (2, 1, 6, N'Kỹ sư Điện', N'Chúng tôi đang tuyển Kỹ sư Điện để thiết kế và triển khai hệ thống và thành phần điện.', 75000, 95000, N'Hồ Chí Minh', 2, 1, '2024-01-22', '2024-05-20', 1, 'https://example.com/electrical-engineer'),
    
    (2, 1, 7, N'Tổ chức Sự kiện', N'Tham gia đội của chúng tôi với vai trò Tổ chức Sự kiện để lên kế hoạch và tổ chức các sự kiện đa dạng cho tổ chức của chúng tôi.', 50000, 70000, N'Hà Nội', 2, 1, '2024-01-23', '2024-05-25', 1, 'https://example.com/event-coordinator'),
    
    (2, 1, 8, N'Quản lý Dịch vụ Khách hàng', N'Chúng tôi đang tuyển Quản lý Dịch vụ Khách hàng để dẫn dắt và giám sát đội ngũ hỗ trợ khách hàng của chúng tôi.', 60000, 80000, N'Hồ Chí Minh', 4, 3, '2024-01-24', '2024-05-30', 1, 'https://example.com/customer-service-manager'),
    
    (2, 1, 9, N'Chuyên viên Thu hút Tài năng', N'Tìm kiếm Chuyên viên Thu hút Tài năng để xác định và tuyển dụng những tài năng hàng đầu cho tổ chức của chúng tôi.', 55000, 75000, N'Hải Dương', 3, 2, '2024-01-25', '2024-06-01', 1, 'https://example.com/talent-acquisition-specialist'),
    
    (2, 1, 10, N'Kỹ thuật viên Phòng thí nghiệm Hóa học', N'Tham gia đội nghiên cứu của chúng tôi với vai trò Kỹ thuật viên Phòng thí nghiệm Hóa học để tiến hành thí nghiệm và phân tích dữ liệu.', 50000, 70000, N'Hồ Chí Minh', 2, 1, '2024-01-26', '2024-06-05', 1, 'https://example.com/chemical-lab-technician');