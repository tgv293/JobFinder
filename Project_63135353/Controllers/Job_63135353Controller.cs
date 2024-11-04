using DatabaseLayer;
using PagedList;
using Project_63135353.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace Project_63135353.Controllers
{
    public class Job_63135353Controller : Controller
    {
        private Project_63135353Entities db = new Project_63135353Entities();

        // GET: Job_63135353
        public ActionResult PostJob()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }

            var job = new PostJobMV_63135353();
            ViewBag.JobCategoryID = new SelectList(db.JobCategoryTables.ToList(), "JobCategoryID", "JobCategory", "0");
            ViewBag.JobNatureID = new SelectList(db.JobNatureTables.ToList(), "JobNatureID", "JobNature", "0");
            job.ApplicationLastDate = DateTime.Now.AddDays(15);
            return View(job);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PostJob(PostJobMV_63135353 postJobMV)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }

            int userID = 0;
            int companyID = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userID);
            int.TryParse(Convert.ToString(Session["CompanyID"]), out companyID);
            postJobMV.UserID = userID;
            postJobMV.CompanyID = companyID;

            if (ModelState.IsValid)
            {
                var post = new PostJobTable();
                post.UserID = postJobMV.UserID;
                post.CompanyID = postJobMV.CompanyID;
                post.JobCategoryID = postJobMV.JobCategoryID;
                post.JobTitle = postJobMV.JobTitle;
                post.JobDescription = postJobMV.JobDescription;
                post.MinSalary = postJobMV.MinSalary;
                post.MaxSalary = postJobMV.MaxSalary;
                post.Location = postJobMV.Location;
                post.Vacancy = postJobMV.Vacancy;
                post.JobNatureID = postJobMV.JobNatureID;
                post.PostDate = DateTime.Now;
                post.ApplicationLastDate = postJobMV.ApplicationLastDate;
                post.JobStatusID = 1;
                post.WebUrl = postJobMV.WebUrl;
                db.PostJobTables.Add(post);
                db.SaveChanges();
                return Json(new { success = true, redirectUrl = Url.Action("CompanyJobList") });
            }

            // Xử lý khi dữ liệu không hợp lệ
            var errors = ModelState.ToDictionary(
                kvp => kvp.Key,
                kvp => kvp.Value.Errors.Select(e => e.ErrorMessage).ToArray()
            );

            return Json(new { success = false, errors });
        }

        public ActionResult CompanyJobList(int? page)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }

            int userID = 0;
            int companyID = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userID);
            int.TryParse(Convert.ToString(Session["CompanyID"]), out companyID);

            var allpost = db.PostJobTables.Where(c => c.CompanyID == companyID && c.UserID == userID).ToList();

            int pageSize = 10;

            int pageNumber = (page ?? 1);

            var pagedPostList = allpost.ToPagedList(pageNumber, pageSize);

            int totalJobPostsCount = allpost.Count;

            ViewBag.TotalJobPostsCount = totalJobPostsCount;

            return View(pagedPostList);
        }

        public ActionResult AllCompanyPendingJobs(int? page)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }

            int userID = 0;
            int companyID = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userID);
            int.TryParse(Convert.ToString(Session["CompanyID"]), out companyID);

            var allpost = db.PostJobTables.Where(c => c.JobStatusID == 1).ToList();

            if (allpost.Count() > 0)
            {
                allpost = allpost.OrderByDescending(o => o.PostJobID).ToList();
            }

            if (page == null) page = 1;

            int pageSize = 10; // Adjust the pageSize as needed
            int pageNumber = (page ?? 1);

            var pagedList = allpost.ToPagedList(pageNumber, pageSize);

            int totalJobPostsCount = allpost.Count;

            ViewBag.TotalJobPostsCount = totalJobPostsCount;

            return View(pagedList);
        }

        public ActionResult AddJobRequirements(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }

            var details = db.JobRequirementDetailTables.Where(j => j.PostJobID == id).ToList();
            if (details.Count > 0)
            {
                details = details.OrderBy(r => r.JobRequirementID).ToList();
            }
            var requirements = new JobRequirementsMV_63135353();
            requirements.Details = details;
            requirements.PostJobID = (int)id;

            ViewBag.JobRequirementID = new SelectList(db.JobRequirementTables.ToList(), "JobRequirementID", "JobRequirementTitle", "0");
            return View(requirements);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddJobRequirements(JobRequirementsMV_63135353 jobRequirementsMV)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }

            try
            {
                var requirements = new JobRequirementDetailTable();
                requirements.JobRequirementID = jobRequirementsMV.JobRequirementID;
                requirements.JobRequirementDetail = jobRequirementsMV.JobRequirementDetail;
                requirements.PostJobID = jobRequirementsMV.PostJobID;
                db.JobRequirementDetailTables.Add(requirements);
                db.SaveChanges();
                return RedirectToAction("AddJobRequirements", new { id = requirements.PostJobID });
            }
            catch (Exception ex)
            {
                var details = db.JobRequirementDetailTables.Where(j => j.PostJobID == jobRequirementsMV.PostJobID).ToList();
                if (details.Count() > 0)
                {
                    details = details.OrderBy(r => r.JobRequirementID).ToList();
                }
                jobRequirementsMV.Details = details;
                ModelState.AddModelError("JobRequirementID", "Vui lòng chọn!");
            }

            ViewBag.JobRequirementID = new SelectList(db.JobRequirementTables.ToList(), "JobRequirementID", "JobRequirementTitle", jobRequirementsMV.JobRequirementID);
            return View(jobRequirementsMV);
        }

        public ActionResult DeleteRequirements(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            var jobPostID = db.JobRequirementDetailTables.Find(id).PostJobID;
            var requirements = db.JobRequirementDetailTables.Find(id);
            db.Entry(requirements).State = System.Data.Entity.EntityState.Deleted;
            db.SaveChanges();
            return RedirectToAction("AddJobRequirements", new { id = jobPostID });
        }

        public ActionResult DeleteJobPost(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            var jobPost = db.PostJobTables.Find(id);
            db.Entry(jobPost).State = System.Data.Entity.EntityState.Deleted;
            db.SaveChanges();
            return RedirectToAction("CompanyJobList");
        }

        public ActionResult ApprovedPost(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            var jobPost = db.PostJobTables.Find(id);
            jobPost.JobStatusID = 2;
            db.Entry(jobPost).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("AllCompanyPendingJobs");
        }

        public ActionResult CanceledPost(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            var jobPost = db.PostJobTables.Find(id);
            jobPost.JobStatusID = 3;
            db.Entry(jobPost).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("AllCompanyPendingJobs");
        }

        public ActionResult JobDetails(int? id)
        {
            var getPostJob = db.PostJobTables.Find(id);
            var postJob = new PostJobDetailMV_63135353();
            postJob.PostJobID = getPostJob.PostJobID;
            postJob.Company = getPostJob.CompanyTable.CompanyName;
            postJob.JobCategory = getPostJob.JobCategoryTable.JobCategory;
            postJob.JobTitle = getPostJob.JobTitle;
            postJob.JobDescription = getPostJob.JobDescription;
            postJob.MinSalary = getPostJob.MinSalary;
            postJob.MaxSalary = getPostJob.MaxSalary;
            postJob.Location = getPostJob.Location;
            postJob.Vacancy = getPostJob.Vacancy;
            postJob.JobNature = getPostJob.JobNatureTable.JobNature;
            postJob.PostDate = getPostJob.PostDate;
            postJob.ApplicationLastDate = getPostJob.ApplicationLastDate;
            postJob.WebUrl = getPostJob.WebUrl;

            getPostJob.JobRequirementDetailTables = getPostJob.JobRequirementDetailTables.OrderBy(d => d.JobRequirementID).ToList();
            int jobRequirementID = 0;
            var jobRequirements = new JobRequirementMV_63135353();

            foreach (var detail in getPostJob.JobRequirementDetailTables)
            {
                var jobRequirementsDetails = new JobRequirementDetailMV_63135353();
                if (jobRequirementID == 0)
                {
                    jobRequirements.JobRequirementID = detail.JobRequirementID;
                    jobRequirements.JobRequirementTitle = detail.JobRequirementTable.JobRequirementTitle;
                    jobRequirementsDetails.JobRequirementID = detail.JobRequirementID;
                    jobRequirementsDetails.JobRequirementDetail = detail.JobRequirementDetail;
                    jobRequirements.Details.Add(jobRequirementsDetails);
                    jobRequirementID = detail.JobRequirementID;
                }
                else if (jobRequirementID == detail.JobRequirementID)
                {
                    jobRequirementsDetails.JobRequirementID = detail.JobRequirementID;
                    jobRequirementsDetails.JobRequirementDetail = detail.JobRequirementDetail;
                    jobRequirements.Details.Add(jobRequirementsDetails);
                    jobRequirementID = detail.JobRequirementID;
                }
                else if (jobRequirementID != detail.JobRequirementID)
                {
                    postJob.Requirements.Add(jobRequirements);
                    jobRequirements = new JobRequirementMV_63135353();
                    jobRequirements.JobRequirementID = detail.JobRequirementID;
                    jobRequirements.JobRequirementTitle = detail.JobRequirementTable.JobRequirementTitle;
                    jobRequirementsDetails.JobRequirementID = detail.JobRequirementID;
                    jobRequirementsDetails.JobRequirementDetail = detail.JobRequirementDetail;
                    jobRequirements.Details.Add(jobRequirementsDetails);
                    jobRequirementID = detail.JobRequirementID;
                }
            }
            postJob.Requirements.Add(jobRequirements);
            return View(postJob);
        }

        [HttpGet]
        public ActionResult FilterJob(int? page)
        {
            var obj = new FilterJobMV_63135353();
            var date = DateTime.Now.Date;
            var result = db.PostJobTables.Where(r => r.ApplicationLastDate >= date && r.JobStatusID == 2).ToList();
            obj.Result = result;
            ViewBag.JobCategoryID = new SelectList(db.JobCategoryTables.ToList(), "JobCategoryID", "JobCategory", "0");
            ViewBag.JobNatureID = new SelectList(db.JobNatureTables.ToList(), "JobNatureID", "JobNature", "0");
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult FilterJob(FilterJobMV_63135353 filterJobMV)
        {
            var date = DateTime.Now.Date;
            var result = db.PostJobTables
                .Where(r => r.ApplicationLastDate >= date && r.JobStatusID == 2);

            // Lọc theo JobCategoryID nếu có giá trị được chỉ định
            if (filterJobMV.JobCategoryID != 0)
            {
                result = result.Where(r => r.JobCategoryID == filterJobMV.JobCategoryID);
            }

            // Lọc theo JobNatureID nếu có giá trị được chỉ định
            if (filterJobMV.JobNatureID != 0)
            {
                result = result.Where(r => r.JobNatureID == filterJobMV.JobNatureID);
            }

            // Lọc theo Location nếu có giá trị được chỉ định
            if (!string.IsNullOrEmpty(filterJobMV.Location))
            {
                result = result.Where(r => r.Location.Contains(filterJobMV.Location));
            }

            if (filterJobMV.MinSalary > 0)
            {
                result = result.Where(r => r.MaxSalary >= filterJobMV.MinSalary);
            }

            if (filterJobMV.MaxSalary > 0)
            {
                result = result.Where(r => r.MinSalary <= filterJobMV.MaxSalary);
            }

            filterJobMV.Result = result.ToList();

            // Lấy danh sách JobCategory và JobNature để hiển thị lại dropdown
            ViewBag.JobCategoryID = new SelectList(db.JobCategoryTables.ToList(), "JobCategoryID", "JobCategory", filterJobMV.JobCategoryID);
            ViewBag.JobNatureID = new SelectList(db.JobNatureTables.ToList(), "JobNatureID", "JobNature", filterJobMV.JobNatureID);

            return View(filterJobMV);
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