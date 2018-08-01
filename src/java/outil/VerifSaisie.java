/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package outil;
import java.util.regex.*;
import exception.Exceptions;
import javax.swing.JRadioButton;

/**
 *
 * @author cdi311
 */
public class VerifSaisie {
    
    static public void checkNom(String nom) throws Exceptions {
        if (nom == null) {
            throw new Exceptions(1, "Un nom ne peut etre null");
        }
        if (nom.trim().isEmpty()) {
            throw new Exceptions(2, "Le nom est obligatoire");
        }
        if (nom.trim().length() < 3) {
            throw new Exceptions(3, "Un nom doit faire au moins 2 caractères");
        }
        if (!nom.matches("[a-zA-Z]{2,150}")){
            throw new Exceptions(4, "Un nom ne peut pas être des chiffres");
        }
        if (nom.trim().length() >= 150) {
            throw new Exceptions(5, "Un nom ne peut pas être supérieur à 150 caractères");
        }
    }
    
    static public void checkPrenom(String prenom) throws Exceptions {

        if (prenom == null) {
            throw new Exceptions(1, "Un prénom ne peut etre null");
        }
        if (prenom.trim().isEmpty()) {
            throw new Exceptions(2, "Le prénom est obligatoire");
        }
        if (prenom.trim().length() < 3) {
            throw new Exceptions(3, "Un prénom doit faire au moins 2 caractères");
        }
        if (!prenom.matches("[a-zA-Z]{2,150}")) {
            throw new Exceptions(4, "Un prenom ne peut pas être des chiffres");
        }
        if (prenom.trim().length() >= 150) {
            throw new Exceptions(5, "Un prenom ne peut pas être supérieur à 150 caractères");
        }
       }

    static public void checkNumTel(String numTel) throws Exceptions {
        if (numTel.trim().isEmpty()) {
            throw new Exceptions(1, "Le numéro est obligatoire");
        }
        
        if (numTel.trim().length() < 10) {
            throw new Exceptions(2, "Un numéro de téléphone est composé de 10 chiffres");
        }
        if (numTel.trim().length() > 10) {
            throw new Exceptions(3, "Le numéro de téléphone fait plus de 10 chiffres");
        }
        if (numTel.matches("([.])")) {
            throw new Exceptions(4, "Merci de mettre le numéro de téléphone sans caractère");
        }
        
//        if (!numTel.matches("(\\+33|0)[1-9]([-.\\/:]{0,1}[0-9]{2}){4}")) {
//            throw new Exceptions(4, "Le numéro n'est pas valide");
//        }
    }

    static public void checkAdresse(String adresse) throws Exceptions{
        if(adresse.trim().isEmpty()){
             throw new Exceptions(1,"L'adresse est obligatoire");
        }
        if (adresse == null) {
            throw new Exceptions(2, "L'adresse ne peut pas être null");
        }
        if (adresse.trim().length() >= 250) {
            throw new Exceptions(3, "L'adresse ne peut pas faire plus de 250 caractères");
        }       
    }
    
    static public void checkCodePostal(String cp) throws Exceptions{
        if (cp.trim().isEmpty()) {
            throw new Exceptions(1,"Le code postal est obligatoire");
        }
        if (cp.trim().length() > 5) {
            throw new Exceptions(2, "Le code postal est composé de 5 chiffres");
        }
        if (!cp.matches("[0-9]{5}")) {
            throw new Exceptions(3, "Le code postal est composé de 5 chiffres de 0 à 9");
        }
    }
    
    static public void checkVille(String ville) throws Exceptions{
        if (ville.isEmpty()) {
            throw new Exceptions(1, "La ville est obligatoire");
        }
        if (!ville.matches("[a-z A-Z]{1,50}")) {
            throw new Exceptions(2, "La ville est composée seulement de caractère");
        }
        if (ville.length() > 150) {
            throw new Exceptions(3, "La ville ne peut pas faire plus de 150 caractères");
        }    
    }
    
    static public void checkGenre(JRadioButton h,JRadioButton f) throws Exceptions{
        if (!f.isSelected() && !h.isSelected()){
            throw new Exceptions(1, "Il faut sélectionner le Genre");
        }
    }
    
    static public void checkDate(String ladate) throws Exceptions{
        if (ladate == null) {
            throw new Exceptions("Une date ne peut etre null");
        }
        if (ladate.trim().isEmpty()) {
            throw new Exceptions("Une date ne peut etre vide");
        }
        if (ladate.matches("^(0?\\d|[12]\\d|3[01])-(0?\\d|1[012])-((?:19|20)\\d{2})")) {
            throw new Exceptions("Un format date jj/mm/aaaa est requis.");
        }
        if (ladate.equalsIgnoreCase("jj/mm/aaaa")) {
            throw new Exceptions(4, "La date n'est pas renseignée");
        }
    };
    
    static public void checkMdp(String mdp) throws Exceptions{
        if (mdp.isEmpty()) {
            throw new Exceptions(1, "Le mot de passe est obligatoire");
        }
    }
    
    static public void checkEmail(String mail) throws Exceptions{
        if (mail.isEmpty()) {
            throw new Exceptions(1, "L'adresse mail est obligatoire");
        }
        if (!mail.matches("[0-9a-z][-.0-9_a-z]*@[0-9a-z][-.0-9a-z]*[0-9a-z]{2,}")) {
            throw new Exceptions(2, "Le format de l'adresse mail n'est pas valide >> format de type xxx@xxx.xx");
        }
    }
    
}
