using DatabaseLayer;
using PagedList;
using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace Project_63135353.Controllers
{
    public class JobCategoryTables_63135353Controller : Controller
    {
        private Project_63135353Entities db = new Project_63135353Entities();

        // GET: JobCategoryTables_63135353
        public ActionResult Index(int? page)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }

            if (page == null) page = 1;

            // Retrieve the total number of users
            int totalCategories = db.JobCategoryTables.Count();

            var categories = (from l in db.JobCategoryTables
                         select l).OrderBy(x => x.JobCategoryID);

            int pageSize = 3;
            int pageNumber = (page ?? 1);

            var pagedList = categories.ToPagedList(pageNumber, pageSize);

            // Pass the totalUsers value to the view
            ViewBag.TotalCategories = totalCategories;

            return View(pagedList);
        }

        // GET: JobCategoryTables_63135353/Create
        public ActionResult Create()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            return View(new JobCategoryTable());
        }

        // POST: JobCategoryTables_63135353/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "JobCategoryID,JobCategory,Description")] JobCategoryTable jobCategoryTable)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            if (ModelState.IsValid)
            {
                db.JobCategoryTables.Add(jobCategoryTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(jobCategoryTable);
        }

        // GET: JobCategoryTables_63135353/Edit/5
        public ActionResult Edit(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobCategoryTable jobCategoryTable = db.JobCategoryTables.Find(id);
            if (jobCategoryTable == null)
            {
                return HttpNotFound();
            }
            return View(jobCategoryTable);
        }

        // POST: JobCategoryTables_63135353/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "JobCategoryID,JobCategory,Description")] JobCategoryTable jobCategoryTable)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            if (ModelState.IsValid)
            {
                db.Entry(jobCategoryTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(jobCategoryTable);
        }

        // GET: JobCategoryTables_63135353/Delete/5
        public ActionResult Delete(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            JobCategoryTable jobCategoryTable = db.JobCategoryTables.Find(id);
            if (jobCategoryTable == null)
            {
                return HttpNotFound();
            }
            return View(jobCategoryTable);
        }

        // POST: JobCategoryTables_63135353/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User_63135353");
            }
            JobCategoryTable jobCategoryTable = db.JobCategoryTables.Find(id);
            db.JobCategoryTables.Remove(jobCategoryTable);
            db.SaveChanges();
            return RedirectToAction("Index");
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