/**
 * @class Name : FileDownloadView
 * @author : PARK
 * @since : 2019. 11. 16.
 * @version 1.0
 * @description 첨부파일 다운로드
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 	수정일			수정자				수정내용
 * -------------------------------------------------------------------
 *	2019. 11. 16.		PARK			최초 생성
 * -------------------------------------------------------------------
 * </pre>
 */
package com.cmm.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;


public class FileDownloadView extends AbstractView{

	private static final Logger logger = LoggerFactory.getLogger(FileDownloadView.class);

	/*public FileDownloadView(){
		setContentType("application/download;utf-8");
	}
*/
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.debug("FileDownload Start");
		
		File file = (File)model.get("downloadFile");
        if(file != null) {
            String fileName = model.get("fileOrgNm").toString();
            String userAgent = request.getHeader("User-Agent");
            
            if(userAgent.indexOf("Chrome") > -1) {
            	StringBuffer sb = new StringBuffer();
            	for(int i=0; i<fileName.length(); i++) {
            		char c = fileName.charAt(i);
            		if(c > '~') {
            			sb.append(URLEncoder.encode(""+c, "UTF-8"));
            		}else {
            			sb.append(c);
            		}
            	}
            	fileName = sb.toString();
            }
            
            response.setContentType(getContentType());
            response.setContentLength((int)file.length());
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
            response.setHeader("Content-Transfer-Encoding", "binary");
            
            OutputStream out = response.getOutputStream();
            FileInputStream fis = null;
            try {
                fis = new FileInputStream(file);
                FileCopyUtils.copy(fis, out);
            } catch(Exception e){
                e.printStackTrace();
            }finally{
                if(fis != null){
                    try{
                        fis.close();
                    }catch(Exception e){
                    	e.printStackTrace();
                    }
                }
                
                if(out != null) {
                	out.flush();
                }
            }
        }
		logger.debug("FileDownload End");
	}
}
