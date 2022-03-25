using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontLab.DATA.EF;
using PagedList;
using PagedList.Mvc;
using StoreFrontLab.UI.MVC.Models;

namespace StoreFrontLab.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Products
        public ActionResult Index(string searchFilter, int page = 1)
        {
            int pageSize = 9;
            var products = db.Products.Include(p => p.Category).OrderBy(p => p.CategoryID).ToList();
            if (!String.IsNullOrEmpty(searchFilter))
            {
                products = (from p in products
                            where p.Category.CategoryName.ToLower().Contains(searchFilter.ToLower())
                            select p).ToList();

                //products = db.Categories.Where(p => p.CategoryName.ToLower().Contains(searchFilter.ToLower()).ToList();
            }
            ViewBag.SearchFilter = searchFilter;
            return View(products.ToPagedList(page, pageSize));
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.StockStatusID = new SelectList(db.StockStatuses, "StockStatusID", "StockStatusName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,CategoryID,Price,StockStatusID,Quantity,Description")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {

                string imageName = "noImage.png";

                if (productImage != null)
                {
                    imageName = productImage.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf('.'));

                    string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;

                        productImage.SaveAs(Server.MapPath("~/Content/assets/images/products/" + imageName));
                    }
                    else
                    {
                        imageName = "noImage.png";
                    }
                }

                product.Image = imageName;

                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.StockStatusID = new SelectList(db.StockStatuses, "StockStatusID", "StockStatusName", product.StockStatusID);
            return View(product);
        }

        // GET: Products/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.StockStatusID = new SelectList(db.StockStatuses, "StockStatusID", "StockStatusName", product.StockStatusID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,CategoryID,Price,StockStatusID,Quantity,Description")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {

                if (productImage != null)
                {
                    string imageName = productImage.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf('.'));

                    string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;

                        productImage.SaveAs(Server.MapPath("~/Content/assets/images/products/" + imageName));

                        string currentFile = Request.Params["productImage"];
                        if (currentFile != "noImage.png" && currentFile != null)
                        {
                            System.IO.File.Delete(Server.MapPath("~/Content/assets/images/products/" + currentFile));
                        }
                    }
                    product.Image = imageName;
                }

                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.StockStatusID = new SelectList(db.StockStatuses, "StockStatusID", "StockStatusName", product.StockStatusID);
            return View(product);
        }

        //// GET: Products/Delete/5
        //[Authorize(Roles = "Admin")]
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Product product = db.Products.Find(id);
        //    if (product == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(product);
        //}

        //// POST: Products/Delete/5
        //[Authorize(Roles = "Admin")]
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Product product = db.Products.Find(id);
        //    db.Products.Remove(product);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();

            string confirmMessage = string.Format($"Deleted product {product.ProductName} from the database.");
            return Json(new { id = id, message = confirmMessage });
        }

        #region Add To Cart

        public ActionResult AddToCart(int qty, int productID)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            if (Session["cart"] != null)
            {
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            }
            else
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            Product item = db.Products.Where(i => i.ProductID == productID).FirstOrDefault();

            if (item == null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                CartItemViewModel prod = new CartItemViewModel(qty, item);

                    if (shoppingCart.ContainsKey(item.ProductID))
                    {
                        shoppingCart[item.ProductID].Qty += qty;
                    }
                    else
                    {
                        shoppingCart.Add(item.ProductID, prod);
                    }
                Session["cart"] = shoppingCart;
            }
            return RedirectToAction("Index", "ShoppingCart");
        }

        #endregion
    }
}
