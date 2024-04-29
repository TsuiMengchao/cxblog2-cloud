package me.mcx.blog.strategy;

import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传策略
 */
public interface FileUploadStrategy {

    /**
     * 上传文件
     * @param file
     * @param suffix
     * @return
     */
    String fileUpload(MultipartFile file,String suffix);

    /**
     * 文件列表
     * @param pageNo
     * @param pageSize
     * @return
     */
    AjaxResult fileList(int pageNo, int pageSize);

    /**
     * 删除文件
     * @param fileName
     * @return
     */
    Boolean deleteFile(String ...fileName);
}
