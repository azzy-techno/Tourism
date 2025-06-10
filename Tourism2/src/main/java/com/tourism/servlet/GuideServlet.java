package com.tourism.servlet;

import com.tourism.dto.GuideDTO;
import com.tourism.service.GuideService;
import com.tourism.dao.GuideDAO;
import com.tourism.dao.interfaces.IGuideDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GuideServlet extends HttpServlet {
    private GuideService guideService;

    @Override
    public void init() {
        IGuideDAO guideDAO = new GuideDAO();
        guideService = new GuideService(guideDAO);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String language = request.getParameter("language");
        String experience = request.getParameter("experience");

        if (name == null || name.isEmpty()) {
            response.getWriter().write("Error: Guide name cannot be empty.");
            return;
        }

        GuideDTO guide = new GuideDTO();
        guide.setName(name);
        guide.setLanguage(language);
        guide.setExperience(experience);

        boolean success = guideService.addGuide(guide);
        response.getWriter().write(success ? "Guide Added Successfully" : "Error Adding Guide");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int guideId = Integer.parseInt(request.getParameter("guideId"));
        GuideDTO guide = guideService.getGuideById(guideId);

        if (guide != null) {
            response.getWriter().write("Guide Found: " + guide.getName() + ", Language: " + guide.getLanguage());
        } else {
            response.getWriter().write("Guide Not Found");
        }
    }
}
