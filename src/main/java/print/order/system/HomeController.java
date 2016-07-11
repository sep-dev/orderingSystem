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

	@RequestMapping(params = "inquiry", method = RequestMethod.POST)
	public String aa(@ModelAttribute FormModel fm, Model model, HttpSession session) {
		String quiry = fm.getUp();

		List<Map<String, Object>> lista = jdbcTemplate.queryForList(
				"select * from ordertb inner join clienttb on ordertb.orderid = clienttb.orderid where ordertb.orderid = "
						+ "'" + quiry + "'");
		model.addAttribute("data", lista);
		session.setAttribute("Id", quiry);
		model.addAttribute("id", quiry);

		return "inquiry";
	}

	@RequestMapping(params = "pro", method = RequestMethod.POST)
	public String update(@ModelAttribute FormModel fm, Model model, SessionStatus sessionStatus, HttpSession session) {
		int per = fm.getPercent();

		String id = (String) session.getAttribute("Id");

		if (per > 100) {
			return "ud_fail";
		}
		jdbcTemplate.execute("update ordertb set progress = '" + per + "' where orderid = '" + id + "'");

		return "ud_suc";
	}

	@RequestMapping(params = "update", method = RequestMethod.POST)
	public String up(@ModelAttribute FormModel fm, Model model, SessionStatus sessionStatus, HttpSession session) {
		String number = fm.getUp();
		session.setAttribute("Id", number);

		return "update";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginn(Locale locale, Model model) {
		return "home";
	}

	@RequestMapping(value = "/top", method = RequestMethod.GET)
	public String top(Locale locale, Model model) {
		return "top";
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user(Locale locale, Model model) {
		return "user";
	}

	@RequestMapping(value = "/toppage", method = RequestMethod.GET)
	public String admin(Locale locale, Model model) {
		return "toppage";
	}

	@RequestMapping(value = "/login_fail", method = RequestMethod.GET)
	public String error(Locale locale, Model model) {
		return "login_fail";
	}

}
