package rcm.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rcm.dao.ProductDao;
import rcm.entity.Frequency;
import rcm.entity.Product;
import rcm.entity.User;

public class FindAllProducts extends HttpServlet {

	private static final long serialVersionUID = 1202395212421185378L;

	/**
	 * Constructor of the object.
	 */
	public FindAllProducts() {
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
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDao dao = new ProductDao();
		//从session中取出当前登录用户
		User user = (User) request.getSession().getAttribute("currUser");
		List<Frequency> freq = null;
		List<Product> list = null;
		List<Product> productList = dao.findAllProduct();//查找所有商品
		if(user != null){
			freq = dao.findFrequency(user.getId());//查找商品的点击频率
			list = dao.sort(productList, freq);//根据点击频率进行排序
			Iterator<Product> itr = productList.iterator();
			//商品集合去重
			while(itr.hasNext()){
				Product p = itr.next();
				if(list.contains(p)){
					continue;
				}else{
					list.add(p);
				}
			}
		}else{
			list = productList;
		}
		request.setAttribute("productList", list);
		//转发到商品列表JSP页面
		request.getRequestDispatcher("/index_products.jsp").forward(request, response);
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
