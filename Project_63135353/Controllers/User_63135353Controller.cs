using DatabaseLayer;
using PagedList;
using Project_63135353.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Project_63135353.Controllers
{
    public class User_63135353Controller : Controller
    {
        private Project_63135353Entities db = new Project_63135353Entities();

        // GET: User_63135353
        public ActionResult NewUser()
        {
            return View(new UserMV_63135353());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult NewUser(UserMV_63135353 userMV)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra tên đăng nhập đã tồn tại
                var checkUser = db.UserTables.Where(u => u.UserName == userMV.UserName).FirstOrDefault();
                if (checkUser != null)
                {
                    ModelState.AddModelError("UserName", "Tên đăng nhập này đã được sử dụng!");
                    return Json(new { success = false, errors = ModelState.ToDictionary(kvp => kvp.Key, kvp => kvp.Value.Errors.Select(e => e.ErrorMessage)) });
                }

                // Kiểm tra email đã tồn tại
                checkUser = db.UserTables.Where(u => u.EmailAddress == userMV.EmailAddress).FirstOrDefault();
                if (checkUser != null)
                {
                    ModelState.AddModelError("EmailAddress", "Email này đã được đăng ký!");
                    return Json(new { success = false, errors = ModelState.ToDictionary(kvp => kvp.Key, kvp => kvp.Value.Errors.Select(e => e.ErrorMessage)) });
                }

                using (var trans = db.Database.BeginTransaction())
                {
                    try
                    {
                        var user = new UserTable();
                        user.UserName = userMV.UserName;
                        user.Password = userMV.Password;
                        user.ContactNo = userMV.ContactNo;
                        user.EmailAddress = userMV.EmailAddress;
                        user.UserTypeID = userMV.AreYouProvider == true ? 2 : 3;
                        db.UserTables.Add(user);
                        db.SaveChanges();

                        if (userMV.AreYouProvider == true)
                        {
                            var company = new CompanyTable();
                            company.UserID = user.UserID;
                            // Kiểm tra các trường công ty
                            if (string.IsNullOrEmpty(userMV.Company.EmailAddress) || string.IsNullOrEmpty(userMV.Company.CompanyName) ||
                                string.IsNullOrEmpty(userMV.Company.PhoneNo) || string.IsNullOrEmpty(userMV.Company.Description))
                            {
                                trans.Rollback();
                                ModelState.AddModelError(string.Empty, "Vui lòng nhập đúng thông tin!");
                                return Json(new { success = false, errors = GetModelStateErrors() });
                            }

                            company.EmailAddress = userMV.Company.EmailAddress;
                            company.CompanyName = userMV.Company.CompanyName;
                            company.PhoneNo = userMV.Company.PhoneNo;
                            company.Logo = "~/Content/assets/img/logo/logo.png";
                            company.Description = userMV.Company.Description;
                            db.CompanyTables.Add(company);
                            db.SaveChanges();
                        }
                        trans.Commit();
                        // Return a JSON result with the redirect URL
                        return Json(new { success = true, redirectUrl = Url.Action("Login") });
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions and roll back the transaction
                        ModelState.AddModelError(string.Empty, "Vui lòng nhập đúng thông tin!");
                        trans.Rollback();
                        return Json(new { success = false, errors = ModelState.ToDictionary(kvp => kvp.Key, kvp => kvp.Value.Errors.Select(e => e.ErrorMessage)) });
                    }
                }
            }

            // If ModelState is not valid, return JSON with errors
            return Json(new { success = false, errors = ModelState.ToDictionary(kvp => kvp.Key, kvp => kvp.Value.Errors.Select(e => e.ErrorMessage)) });
        }

        // Helper method to get model state errors
        private IEnumerable<string> GetModelStateErrors()
        {
            return ModelState.Values.SelectMany(v => v.Errors.Select(e => e.ErrorMessage));
        }

        public ActionResult Login()
        {
            return View(new UserLoginMV_63135353());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(UserLoginMV_63135353 userLoginMV)
        {
            if (ModelState.IsValid)
            {
                var user = db.UserTables.Where(u => u.UserName == userLoginMV.UserName && u.Password == userLoginMV.Password).FirstOrDefault();
                if (user == null)
                {
                    ModelState.AddModelError(string.Empty, "Tên đăng nhập hoặc Mật khẩu không đúng!");
                    return Json(new { success = false, errors = ModelState.ToDictionary(x => x.Key, x => x.Value.Errors.Select(e => e.ErrorMessage).ToList()) });
                }

                Session["UserID"] = user.UserID;
                Session["UserName"] = user.UserName;
                Session["UserTypeID"] = user.UserTypeID;
                if (user.UserTypeID == 2)
                {
                    Session["CompanyID"] = user.CompanyTables.FirstOrDefault().CompanyID;
                }

                // Return a JSON result with the redirect URL
                return Json(new { success = true, redirectUrl = Url.Action("Index", "Home_63135353") });
            }
            return Json(new { success = false, errors = ModelState.ToDictionary(x => x.Key, x => x.Value.Errors.Select(e => e.ErrorMessage).ToList()) });
        }

        public ActionResult Forgot()
        {
            return View(new ForgotPasswordMV_63135353());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Forgot(ForgotPasswordMV_63135353 forgotPasswordMV)
        {
            var user = db.UserTables.Where(u => u.EmailAddress == forgotPasswordMV.Email).FirstOrDefault();
            if (user != null)
            {
                string userNameAndPass = "Tên đăng nhập: " + user.UserName + "\n" + "Mật khẩu: " + user.Password;
                string body = userNameAndPass;
                bool IsSendEmail = Project_63135353.Forgot.Email_63135353.EmailSend(user.EmailAddress, "Chi tiết về tài khoản", body, true);
                if (IsSendEmail)
                {
                    ModelState.AddModelError(string.Empty, "Tên đăng nhập và Mật khẩu đã được gửi!");
                }
                else
                {
                    ModelState.AddModelError("Email", "Email của bạn đã được đăng ký! Hiện tại Hệ thống gửi Email hoạt động không ổn định, vui lòng thử lại sau.");
                }
            }
            else
            {
                ModelState.AddModelError("Email", "Email không tồn tại trong hệ thống!");
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session["UserID"] = string.Empty;
            Session["UserName"] = string.Empty;
            Session["CompanyID"] = string.Empty;
            Session["UserTypeID"] = string.Empty;
            return RedirectToAction("Index", "Home_63135353");
        }

        public ActionResult AllUsers(int? page)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }

            if (page == null) page = 1;

            // Retrieve the total number of users
            int totalUsers = db.UserTables.Count();

            var users = (from l in db.UserTables
                         select l).OrderBy(x => x.UserID);

            int pageSize = 3;
            int pageNumber = (page ?? 1);

            var pagedList = users.ToPagedList(pageNumber, pageSize);

            // Pass the totalUsers value to the view
            ViewBag.TotalUsers = totalUsers;

            return View(pagedList);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}