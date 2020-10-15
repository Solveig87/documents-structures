# -*- coding: utf-8 -*-
 
import csv
from lxml import etree


# INITIALIZING XML FILE
toilettes = etree.Element("toilettes")
 
# READING CSV FILE AND BUILD TREE
with open("sanisettesparis.csv") as csvfile:
    reader = csv.DictReader(csvfile, delimiter=';')
    
    for row in reader:
        toilette = etree.SubElement(toilettes, "toilette", type=row["TYPE"], statut=row["STATUT"])
        
        adresse = etree.SubElement(toilette, "adresse")
        libelle = etree.SubElement(adresse, "libelle")
        libelle.text = row["ADRESSE"]
        arrondissement = etree.SubElement(adresse, "arrondissement")
        arrondissement.text = row["ARRONDISSEMENT"]
        
        horaire = etree.SubElement(toilette, "horaire")
        horaire.text = row["HORAIRE"]
        
        services = etree.SubElement(toilette, "services")
        accespmr = etree.SubElement(services, "acces-pmr")
        accespmr.text = row["ACCES_PMR"]
        relaisbebe = etree.SubElement(services, "relais-bebe")
        relaisbebe.text = row["RELAIS_BEBE"]
        
        equipement = etree.SubElement(toilette, "equipement")
        equipement.text = row["URL_FICHE_EQUIPEMENT"]
        
        
 
# SAVE XML TO FILE
tree_out = (etree.tostring(toilettes, pretty_print=True, xml_declaration=True, encoding="UTF-8", doctype='<!DOCTYPE toilettes SYSTEM "wc.dtd">'))
 
# OUTPUTTING XML CONTENT TO FILE
with open('toilettes-paris.xml', 'wb') as xmlfile:
    xmlfile.write(tree_out)