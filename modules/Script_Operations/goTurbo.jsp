<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html:html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/turbo.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="/WImpiBLAST/Design/css/Navigation-Style-Sheet.css" media="screen"/> 
        <link href="http://fonts.googleapis.com/css?family=Cabin|Droid+Sans|Molengo" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="/WImpiBLAST/Design/images/favicon.ico">

        <title>WImpiBLAST Create-Script</title>

        <%
            response.setHeader("Cache-Control", "private");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            String action_stat = session.getAttribute("action_stat").toString();
            session.setAttribute("action_stat", "dflt");

        %>
        <script type="text/javascript" src="/WImpiBLAST/Design/css/jquery.js"></script>
        <script type="text/javascript" src="/WImpiBLAST/Design/scripts/turbo.js"  ></script>
    </head>

    <body onload="showstat();">

        <div id="help_menu">

            <p style="font-family: sans-serif;font-weight: bold;color:#6082B6;font-size: 20px; text-align: center;text-decoration: underline;">Help Menu</p>
            <p class="information"> Parameter related information will be displayed in this section. Click on any parameter e.g. 'Input File, Blast Database etc.' to display help. 
                <br> <br> Caution: Incorrect parameters may lead to job termination. Always log out
                after completing your work.<br><br>
                * Def: Definition  <a style="text-decoration: none;float: right;cursor: pointer;box-shadow: 1px 2px 1px 2px ;" onclick="showme('wrkflw');">
                    Hide Help</a>
                * Expl: Explanation

            </p>  
            <hr>

            <p id='emt' class="helpinfo"> EmailId: Necessary <br><br>
                Def: The emalid where notifications will be sent.<br><br>
                Tip: For multiple email recipients separate emailid by comma without any space. 

            </p>

            <p id='qryfle' class="helpinfo"> Input/Query File: Necessary <br><br>
                Def: The input file which will used as the query file to search the database.<br><br>
                Tip: The input file can be a .fasta/.fa or a text file containing the nucleotide or protein sequences etc. 

            </p>

            <p id='bdb' class="helpinfo"> Blast Database: Mandatory<br><br>
                Def: The database in which sequences will be searched.<br><br>
                Expl: This is a mandatory parameter. The sequences present in your fasta file will be
                searched in this database.<br><br>

            </p>

            <p id='bp' class="helpinfo"> Blast program: Mandatory <br><br>
                Def: The blast program to use.<br><br>
                Tip: See list of current supported programs in drop down menu adjacent to this field.
            </p>

            <p id='ap' class="helpinfo"> Advanced Parameters: Optional <br><br>
                Def: Provide any additional parameters to customize the mpiblast search.<br><br>
                Expl: These parameters may include 'expect value, output format' etc. 
                Simply enter desirable values to customize search criteria.
                <br><br>
                Tip: Click 'Advance Parameter' text for list of supported parameters values.
            </p>

            <p id="wrkflw" style="width:328px;">
                <img src="../../Design/images/outline.png" />
            </p>    

        </div>

        <div id="page-container">

            <div id="header">

                <div id="header_style"><h1>WImpiBLAST .</h1>
                    <h2>Web interface for mpiBLAST to help biologist perform large scale annotation
                        using high performance computing</h2>

                </div></div>
            <div id="main-nav"> <%@include file="/Navigation_Menu/Navigation-Layout.jsp"%></div>
            <br><br>
            <div id ="showempty" class="showemptyfields">

                <p align="center"> Looks like you missed some thing. Just fill in the fields to get going!.</p>

            </div>

            <div id="helphint" class="hint">
                Click for help!
            </div>

            <div id="param" class="showerrorstatus">
                <p align="center">

                    There seems to be some issue with parameter settings in configuration file. Please check the parameter values in '.WImpiBLAST.conf'<br>
                    file to ensure all parameters are properly filled. Also ensure that the file exists at default location.
                    <br>In case of any doubt please contact system administrator.
                </p>  
            </div>

            <div id="no" class="showerrorstatus">
                <p align="center">

                    The script can not be created now. Kindly try again later.<br></p>  
            </div>

            <div id="scrptjbnmovrrite" class="showerrorstatus">
                <p align="center">

                    Both the Scriptname and Jobname can not be same.<br>Provide a different Jobname  
                    to prevent overwriting of standard error and output files.</p>  
            </div>

            <div id="fldrexcep" class="showerrorstatus">
                <p align="center">

                    There is some system related problem in creating the job folder. Kindly try later.<br></p>  
            </div>

            <div id="dtaexcep" class="showerrorstatus">
                <p align="center">

                    There is some system related error in writing data to the script. Kindly try later.<br></p>  
            </div>

            <div id="fileexst" class="showerrorstatus">
                <p align="center">

                    A script with given name already exist in the folder. For overwriting the script use 'Modify Older Script' option.<br>
                    This form does not support overwriting the scripts.</p>  
            </div>

            <div id="prmcnflct" class="showerrorstatus">
                <p align="center">

                    There is permission conflicts in creating the script.</p>  
            </div>

            <div id="fldrexst" class="showerrorstatus">
                <p align="center">

                    The directory associated with the current input already exists. Either resubmit using previously created script or try again after changing name 
                    of input file.</p>  
            </div>

            <div id="jobfail" class="showerrorstatus">
                <p align="center">
                    Job Submission Unsuccessful. </p>  
            </div>

            <div id="excep" class="showerrorstatus">
                <p align="center">
                    Due to technical issues , request can not be processed for this script.
                    <br>If this issue persists kindly contact the Administrator@Computational Biology Lab.</p>
            </div>

            <div id="upfilesize" class="showerrorstatus">
                <p align="center">
                    This file violates upload limit of 200Mb. Please select file of lesser size.<br>
                </p>

            </div>

            <div id="light" class='light'>Advance Parameter Help<br>
                When done click anywhere outside this box to close parameter help.<table> 
                    <div class="prmtrinfo"> <br>Expectation value [Real]
                        <br>default = 10.0<br>
                    </div>
                    <div class="prmtrinfo"> <br>alignment view options: (output file format) <br>
                        0 = pairwise,<br>
                        1 = query-anchored showing identities,<br>
                        2 = query-anchored no identities,<br>
                        3 = flat query-anchored, show identities,<br>
                        4 = flat query-anchored, no identities,<br>
                        5 = query-anchored no identities and blunt ends,<br>
                        6 = flat query-anchored, no identities and blunt ends,<br>
                        7 = XML Blast output,<br>
                        8 = tabular,<br>
                        9 tabular with comment lines<br>
                        10 ASN, text<br>
                        11 ASN, binary [Integer]<br>
                        default = 9,range from 0 to 11<br>
                    </div>
                    <div class="prmtrinfo"><br> Number of database sequences to show one-line descriptions for [Integer]<br>
                        default = 1 <br>
                    </div>
                    <div class="prmtrinfo">Number of database sequence to show alignments for [Integer]<br>
                        default = 1<br>
                    </div>
                </table>

            </div>
            <div id="fade" class='fade' onclick="hideparam();"></div>
            <div id="schint" class="hint">
                Press 'Browse' button to select the input file. <br>
                Click to temporarily hide this hint.
            </div>
            <div id="content">

                <div class="padding"> 

                    <html:form action="/turbo_job_submit" enctype="multipart/form-data" method="post" >

                        <table border="0" width="95%">
                            <tr>
                                <td>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">Upload Input File </p>
                                </td>
                            <tr>
                                <td colspan="2">
                                    <hr>
                                </td>
                            </tr>

                            <tr>

                                <td class="content" onmouseover="showhint();" onclick="showme('qryfle');">* <a>Input/Query File</a></td>
                                <td><INPUT type="text" id="inputfilepath" name="inputfilepath" placeholder="Query File" 
                                           autocomplete='off' class="text" readonly="true" onclick="hidehint();">

                                    <input type="file" name="upFile" id="upFile" class="file" onchange="return do_upload(this.value);"/>
                                    <input type="button" value="Browse" class="content_button2" onclick="do_click();"/> 
                                    <div id="req1" class="reqfield"><p>Provide Input File !</p></div>
                                </td>

                            </tr>
                            <tr>
                                <td> <br>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                        Mpiblast Details </p>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="2">
                                    <hr>

                                </td>
                            </tr>

                            <tr>
                                <td class="content" onclick="showme('bdb');"><a>Blast Database</a> </td>
                                <td><SELECT id=blastdb name="blastdb" class="drpdwn">
                                        <OPTION value="nr" selected>nr</OPTION>
                                    </SELECT>
                                    <div id="req2" class="reqfield"><p>Please Select Database!</p></div></td>
                            </tr>
                            <tr>
                                <td class="content" onclick="showme('bp');"><a>Blast Program</a></td>
                                <td><SELECT id=blastbinary name="blastbinary" class="drpdwn">
                                        <OPTION value="blastx" selected>blastx</OPTION>
                                        <OPTION value="blastn">blastn</OPTION>
                                        <OPTION value="blastp">blastp</OPTION>                                                
                                    </SELECT></td>
                            </tr>

                            <tr>
                                <td class="content" onclick="showhelp();"><a>Advance Parameter</a>  
                                </td>
                                <td>
                                    <input type="button" class="helpbutton" id="showap" value="Fill Advance Parameters" onclick="showme('ap');" title="Click to fill parameters.">  
                                    <input type="button" class="helpbutton" id="hideap" style="display: none" value="Hide Advance Parameter" onclick="showme('hideap');" title="Click for Help!">  
                                </td>
                            </tr>
                            <tr>

                                <td class="advanceparam">
                                    Expectation Value<br>
                                    (Default = 10.0)
                                </td>
                                <td>

                                    <INPUT type="text" id=evalue name="evalue" placeholder="E Value" 
                                           autocomplete='off' class="advancetext"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="advanceparam">
                                    Alignment View Options<br>
                                    (Default = 9)
                                </td>
                                <td>
                                    <INPUT type="text" id=outfmt name="outfmt" placeholder="Output Format" 
                                           autocomplete='off' class="advancetext"/>
                                </td></tr>
                            <tr>
                                <td class="advanceparam">
                                    Database Sequences to Show One-Line Descriptions For
                                    (Default = 1)
                                </td>
                                <td>
                                    <INPUT type="text" id=numdesc name="numdesc" placeholder="Enter value" 
                                           autocomplete='off' class="advancetext"/>
                                </td></tr>
                            <tr>
                                <td class="advanceparam">

                                    Number of Sequence to Show Alignments For
                                    (Default = 1)
                                </td>
                                <td>
                                    <INPUT type="text" id=numalgn name="numalgn" placeholder="Enter Value" 
                                           autocomplete='off' class="advancetext"/>
                                </td></tr>

                            <tr>
                                <td>
                                    <p style="font-family: 'Cabin', Helvetica, Arial, sans-serif;font-size: 20px;color: #0772A1;">
                                        Email Notification </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"> 
                                    <hr>
                            </tr>
                            <tr>

                                <td class="content" onclick="showme('emt');"><a> EmailId </a> </td>
                                <td><INPUT type="text" id=emailid name="emailid" placeholder="Enter Comma Seperated Values" 
                                           class="text">
                                    <div id="req3" class="reqfield"><p>Provide EmailID!</p></td>
                            </tr>

                            <tr>
                                <td></td><td>

                                    <input type="submit" class="content_button" name="turbo" id="turbo" value="TURBO SUBMIT" onclick="javascript:return check_for_empty_fields();">
                                    &nbsp; &nbsp;&nbsp; &nbsp;<input type="button" class="content_button" name="reset" id="reset" value="RESET" onclick="reset_fields();">
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" id="action_stat" name="action_stat" value="<%=action_stat%>" />

                    </div>

                </div>
            </html:form>
            <div id="footer">

                <div id="altnav">
                    <a href="/WImpiBLAST/gen/about.html" target="_blank">About</a> - 
                    <a href="/WImpiBLAST/gen/folio.html" target="_blank">Portfolio</a> - 
                    <a href="/WImpiBLAST/gen/contact.html" target="_blank">Contact Us</a> 

                </div>
                <div id="copyright">
                    NABI<br/>
                    Powered by <a href="http://www.nabi.res.in" target="_blank">Computational Biology Lab@NABI</a> 
                </div>
            </div>

        </div>
    </body>
</html:html>


