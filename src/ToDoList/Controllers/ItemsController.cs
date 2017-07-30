﻿using Microsoft.AspNetCore.Mvc;
using System.Linq;
using ToDoList.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ToDoList.Controllers
{
    public class ItemsController : Controller
    {
        private ToDoListContext db = new ToDoListContext();
        public IActionResult Index()
        {
            return View(db.Items.Include(items => items.ItemId).ToList());
        }

        public IActionResult Details(int id)
        {
            Item thisItem = db.Items.FirstOrDefault(items => items.ItemId == id);
            return View(thisItem);
        }

        public IActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name");
            return View();
        }

        [HttpPost]
        public IActionResult Create(Item item)
        {
            db.Items.Add(item);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            Item thisItem = db.Items.FirstOrDefault(items => items.ItemId == id);
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name");
            return View(thisItem);
        }

        [HttpPost]
        public IActionResult Edit(Item item)
        {
            db.Entry(item).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            Item thisItem = db.Items.FirstOrDefault(items => items.ItemId == id);
            return View(thisItem);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            Item thisItem = db.Items.FirstOrDefault(items => items.ItemId == id);
            db.Items.Remove(thisItem);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
