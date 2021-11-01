package com.dh10.dh10_web.oldclass;

import com.dh10.stringchecker.CountryChecker;
import com.dh10.stringchecker.StringChecker;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "countryServlet", value = "/countryservlet")
public class CountryServlet extends HttpServlet {
    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String message = "non trovata corrispondeza";
        StringChecker countrycheck = new CountryChecker();
        String country = request.getParameter("country");
        if(countrycheck.find_standard(country)!=null)
            message = "Nazione Trovata";
        message = "non trovata corrispondeza";
        PrintWriter writer = response.getWriter();
        writer.println("<h1>Country" + country + message + "</h1>");
        writer.close();
    }

    public void destroy() {
    }
}