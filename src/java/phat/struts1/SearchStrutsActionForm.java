
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phat.struts1;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import phat.registration.RegistrationDAO;
import phat.registration.RegistrationDTO;

/**
 *
 * @author user
 */
public class SearchStrutsActionForm extends org.apache.struts.action.ActionForm {
    
   private String searchValue;

    /**
     *
     */
    public SearchStrutsActionForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @return the searchValue
     */
    public String getSearchValue() {
        return searchValue;
    }

    /**
     * @param searchValue the searchValue to set
     */
    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }
    
   private List<RegistrationDTO> accounts;

    public List<RegistrationDTO> getAccounts() {
        return accounts;
    }
   
   
   public void searchLastname(){
       RegistrationDAO dao = new RegistrationDAO();
       try {
           dao.searchLastname(searchValue);
           this.accounts = dao.getListResult();
           System.out.println(accounts);
       } catch (NamingException ex) {
           Logger.getLogger(SearchStrutsActionForm.class.getName()).log(Level.SEVERE, null, ex);
       } catch (SQLException ex) {
           Logger.getLogger(SearchStrutsActionForm.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
}
