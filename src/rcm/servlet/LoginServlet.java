package rcm.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rcm.dao.UserDao;
import rcm.entity.User;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -6030727340944647548L;

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserDao dao = new UserDao();
		String username = req.getParameter("username");
		String pwd = req.getParameter("pwd");
		User user = dao.findUser(username, pwd);
		if(user == null){
			if(username != null && username.length() > 0){
				req.getSession().setAttribute("msg", "用户名或密码错误");
			}
			resp.sendRedirect("login.jsp");
		}else{
			req.getSession().setAttribute("currUser", user);
			resp.sendRedirect("/rcm/index");
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
