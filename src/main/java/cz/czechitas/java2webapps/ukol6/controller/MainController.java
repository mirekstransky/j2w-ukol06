package cz.czechitas.java2webapps.ukol6.controller;

import cz.czechitas.java2webapps.ukol6.entity.Vizitka;
import cz.czechitas.java2webapps.ukol6.repository.VizitkaRepository;
import jakarta.validation.Valid;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class MainController {

    private final VizitkaRepository vizitkaRepository;

    public MainController(VizitkaRepository vizitkaRepository) {
        this.vizitkaRepository = vizitkaRepository;
    }
    @InitBinder
    public void nullStringBinding(WebDataBinder binder) {
        //prázdné textové řetězce nahradit null hodnotou
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
    @GetMapping("/")
    public ModelAndView index(){

        ModelAndView model = new ModelAndView("seznam");
        model.addObject("vizitka",vizitkaRepository.findAll());

        return model;
    }

    @GetMapping("/nova")
    public ModelAndView nova(){
        ModelAndView model = new ModelAndView("formular");
        model.addObject("vizitka",new Vizitka());
        return model;
    }

    @GetMapping("/detail/{id:[0-9]+}")
    public ModelAndView detail(@PathVariable int id) {
        Optional<Vizitka> vizitka = vizitkaRepository.findById(id);
        if (vizitka.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return new ModelAndView("vizitka")
                .addObject("osoba", vizitka.get());
    }
    @PostMapping("/nova")
    public String ulozit(@ModelAttribute("vizitka") @Valid Vizitka vizitka, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "formular";
        }
        vizitkaRepository.save(vizitka);
        return "redirect:/";
    }

    @PostMapping(value = "/delete/{id}", params = {"param1=value1"})
    public String smazat(@PathVariable int id) {
        vizitkaRepository.deleteById(id);
        return "redirect:/";
    }
    @GetMapping("/change/{id:[0-9]+}")
    public Object uprav(ModelAndView model, @PathVariable int id) {
        Optional<Vizitka> vizitka = vizitkaRepository.findById(id);
        if (vizitka.isEmpty()) {
            //throw new ResponseStatusException(HttpStatus.NOT_FOUND);
            return ResponseEntity.notFound().build();
        }
        model.setViewName("formular");
        model.addObject("vizitka", vizitka.get());
        return model;
    }
    @PostMapping("/change/{id:[0-9]+}")
    public String upravit(@ModelAttribute("vizitka") @Valid Vizitka vizitka, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "formular";
        }
        vizitkaRepository.save(vizitka);
        return "redirect:/";
    }

}
