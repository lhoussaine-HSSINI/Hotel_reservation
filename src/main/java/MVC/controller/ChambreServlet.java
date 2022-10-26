package MVC.controller;

import MVC.metier.Chambre;
import MVC.metier.Operation;
import MVC.model.ChambreBeans;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ChambreServlet", value = "/ChambreServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class ChambreServlet extends HttpServlet {
    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Récuperer les information
        Operation op = new Operation();
        if(request.getParameter("action") !=null){
            op.remove(Integer.parseInt(request.getParameter("id")));
        } else if (request.getParameter("type_chambre_edit")!=null && request.getParameter("operation_edit").equals("edit")) {
            System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh edit");
            String type_chambre_edit = request.getParameter("type_chambre_edit");
            int id_edit = Integer.parseInt(request.getParameter("id_edit"));
            int prix_edit = Integer.parseInt(request.getParameter("prix_edit"));
            int promo_edit = Integer.parseInt(request.getParameter("promo_edit"));
            System.out.println(" edit  chambre ==>  numbre = "+id_edit+" type_chambre  = "+type_chambre_edit+" prix = "
                    +prix_edit+" promo = "+promo_edit);
            //Creation des object
            try {
                op.edit(id_edit, type_chambre_edit, prix_edit, promo_edit);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            if (request.getParameter("type_chambre")!=null && request.getParameter("operation_add").equals("add")) {
                String Type_chambre = request.getParameter("type_chambre");
                int Prix = Integer.parseInt(request.getParameter("prix"));
                int Promo = Integer.parseInt(request.getParameter("promo"));
                int etat_chambre =0;
                Part part_1 = request.getPart("file_1");//
                String fileName_1 = extractFileName(part_1);//file name
                Part part_2 = request.getPart("file_2");//
                String fileName_2 = extractFileName(part_2);//file name
                Part part_3 = request.getPart("file_3");//
                String fileName_3 = extractFileName(part_3);//file name
                Part part_4 = request.getPart("file_4");//
                String fileName_4 = extractFileName(part_4);//file name
                Part part_5 = request.getPart("file_5");//
                String fileName_5 = extractFileName(part_5);//file name
                Part part_6 = request.getPart("file_6");//
                String fileName_6 = extractFileName(part_6);//file name


                /**
                 * *** Get The Absolute Path Of The Web Application ****
                 */
                String applicationPath = getServletContext().getRealPath("");
                String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
//                System.out.println("applicationPath:" + applicationPath);
                File fileUploadDirectory = new File(uploadPath);
                if (!fileUploadDirectory.exists()) {
                    fileUploadDirectory.mkdirs();
                }
                String savePath = null;
                savePath = uploadPath + File.separator + fileName_1;
                part_1.write(savePath + File.separator);

                savePath = uploadPath + File.separator + fileName_2;
                part_2.write(savePath + File.separator);

                savePath = uploadPath + File.separator + fileName_3;
                part_3.write(savePath + File.separator);

                savePath = uploadPath + File.separator + fileName_4;
                part_4.write(savePath + File.separator);

                savePath = uploadPath + File.separator + fileName_5;
                part_5.write(savePath + File.separator);

                savePath = uploadPath + File.separator + fileName_6;
                part_6.write(savePath + File.separator);

                dbFileName =fileName_1+ "+"+ fileName_2+ "+"+ fileName_3+ "+"+ fileName_4+ "+"+ fileName_5+ "+"+ fileName_6;


                //Creation des object
                try {
                    op.add(new Chambre(1,Type_chambre, dbFileName,etat_chambre, Prix, Promo));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        }
        ChambreBeans chb = new ChambreBeans();
        chb.setList(op.getAll());
        request.setAttribute("modele", chb);
        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
    }

    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
