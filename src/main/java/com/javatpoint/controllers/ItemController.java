package com.javatpoint.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javatpoint.beans.Item;
import com.javatpoint.dao.ItemDao;

@Controller
public class ItemController {

    @Autowired
    ItemDao dao;

    @RequestMapping("/itemform")
    public String showform(Model m) {
        m.addAttribute("command", new Item());
        return "itemform";
    }

    @RequestMapping(value = "/saveitem", method = RequestMethod.POST)
    public String save(@ModelAttribute("item") Item item) {
        dao.save(item);
        return "redirect:/viewitem";
    }

   
    
    @RequestMapping("/viewitem")
    public String viewitem(Model m) {
        List<Item> list = dao.getItems();
        m.addAttribute("list", list);
        return "viewitem";
    }

    @RequestMapping(value = "/edititem/{itemnumber}")
    public String edit(@PathVariable int itemnumber, Model m) {
        Item item = dao.getItemByItemnumber(itemnumber);
        m.addAttribute("command", item);
        return "itemeditform";
    }

    @RequestMapping(value = "/editsaveitem", method = RequestMethod.POST)
    public String editsave(@ModelAttribute("item") Item item) {
        dao.update(item);
        return "redirect:/viewitem";
    }
    
    
    @RequestMapping(value = "/deleteItems", method = RequestMethod.POST)
    public String deleteItems(@RequestParam("selectedItems") List<Integer> itemNumbers, RedirectAttributes redirectAttributes) {
        if (itemNumbers != null && !itemNumbers.isEmpty()) {
            // Delete the selected items
            dao.delete(itemNumbers);

            // Add a success message
            redirectAttributes.addFlashAttribute("message", "Selected items were deleted successfully.");
        } else {
            // Add a message indicating no items were selected
            redirectAttributes.addFlashAttribute("message", "No items were selected for deletion.");
        }

        // Redirect back to the item list page
        return "redirect:/viewitem";
    }
    
   
}
