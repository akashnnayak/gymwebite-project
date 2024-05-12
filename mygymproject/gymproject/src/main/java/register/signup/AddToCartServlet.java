package register.signup;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import register.model.*;



public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
//        	out.print("add to cart servlet");

            ArrayList<Cart> cartList = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("id"));
            Cart cm = new Cart();
            cm.setId(id);
            cm.setQuantity(1);
            HttpSession session = request.getSession();
            @SuppressWarnings("unchecked")
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
            if (cart_list == null) {
                cartList.add(cm);
                session.setAttribute("cart-list", cartList);
                response.sendRedirect("product.jsp");
            } else {
                cartList = cart_list;

                boolean exist = false;
                for (Cart c : cart_list) {
                    if (c.getId() == id) {
                        exist = true;
                        out.println("<div style='position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;'>");
                        out.println("<h3 style='color: crimson; font-size: 30px;'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>");
                        out.println("</div>");
                    }
                }

                if (!exist) {
                    cartList.add(cm);
                    response.sendRedirect("product.jsp");
                }
            }
        }
	}

}
