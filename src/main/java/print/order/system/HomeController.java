package print.order.system;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		List<Map<String, Object>> list = jdbcTemplate
				.queryForList("select * from ordertb inner join clienttb on ordertb.orderid = clienttb.orderid;");
		model.addAttribute("db", list);
		model.addAttribute("id", list.get(0).get("id"));
		return "list";
	}

	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public String logi(Locale locale, Model model) {

		return "menu";
	}

	@RequestMapping(value = "/Frame", method = RequestMethod.GET)
	public String log(Locale locale, Model model) {

		return "Frame";
	}

	@RequestMapping(params = "list", method = RequestMethod.POST)
	public String bb(@ModelAttribute FormModel fm, Model model, SessionStatus sessionStatus, HttpSession session) {
		List<Map<String, Object>> list = jdbcTemplate
				.queryForList("select * from ordertb inner join clienttb on ordertb.orderid = clienttb.orderid;");
		model.addAttribute("db", list);
		model.addAttribute("id", list);

		return "list";
	}

}