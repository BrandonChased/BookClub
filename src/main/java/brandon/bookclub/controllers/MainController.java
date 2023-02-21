package brandon.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import brandon.bookclub.models.LoginUser;
import brandon.bookclub.models.User;
import brandon.bookclub.services.UserService;

@Controller
public class MainController {

    @Autowired
    private UserService userService;
    
    // Login Register Page
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    // Creates a new User
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        User user = userService.register(newUser, result);
        
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getUserName());

        return "redirect:/books";
    }
    
    // Controls returning users and logs them in
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userService.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            System.out.println("this route");
            return "index.jsp";
        }

        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getUserName());

        return "redirect:/books";
    }

    // Logs Users out and clears session
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
