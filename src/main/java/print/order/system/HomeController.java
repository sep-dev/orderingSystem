package print.order.system;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private JdbcTemplate jdbcTemplate;

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

}