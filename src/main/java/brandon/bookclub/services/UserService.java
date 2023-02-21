package brandon.bookclub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import brandon.bookclub.models.LoginUser;
import brandon.bookclub.models.User;
import brandon.bookclub.repositories.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;

    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
        Optional<User> user = userRepository.findByEmail(newUser.getEmail());
        if (user.isPresent()) {
            result.rejectValue("email", "Email", "Email already registered");
        }
        if (!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Confirm", "Passwords do not match");
        }
        if (result.hasErrors()) {
            return null;
        }

        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);

        return userRepository.save(newUser);
    }

    public User login(LoginUser newLoginObject, BindingResult result) {
        User loginUser = userRepository.findByEmail(newLoginObject.getEmail()).orElse(null);

        if(loginUser == null) {
            result.rejectValue("email", "noEmail", "Invalid Login!");
        }
        // User user = null;
        if (loginUser != null) {
            // user = loginUser.get();
            if (!BCrypt.checkpw(newLoginObject.getPassword(), loginUser.getPassword())) {
                result.rejectValue("password","matches", "Invalid Login!" );
            }
            if (result.hasErrors()) {
                return null;
            }
        }
        return loginUser;
    }
}
