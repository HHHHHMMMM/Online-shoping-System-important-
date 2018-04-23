package rcm.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rcm.dao.ProductDao;
import rcm.entity.Product;
import rcm.entity.User;

public class ProductDetailServlet extends HttpServlet {

	private static final long serialVersionUID = -2321114215952872845L;

	/**
	 * Constructor of the object.
	 */
	public ProductDetailServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ProductDao dao = new ProductDao();
		//根据商品ID查找商品信息
		Product p = dao.findProduct(Integer.valueOf(req.getParameter("pid")));
		//从session中取出当前登录用户信息
		User user = (User) req.getSession().getAttribute("currUser");
		//增长点击量
		dao.addClickTimes(req.getParameter("pid"), user);
		req.setAttribute("product", p);
		//转发到商品详情页面
		req.getRequestDispatcher("/product_detail.jsp").forward(req, resp);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
