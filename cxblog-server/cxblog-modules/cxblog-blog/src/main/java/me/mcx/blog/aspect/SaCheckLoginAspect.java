package me.mcx.blog.aspect;

import me.mcx.common.security.auth.AuthUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description 登录校验切面
 * @author coisini
 * @date Oct 14, 2021
 * @Version 1.0
 */
@Aspect
@Component
public class SaCheckLoginAspect {
    /**
     * 只要加了@CheckLogin的方法都会走到这里
     * @param point
     * @return
     */
    @Around("@annotation(me.mcx.blog.annotation.SaCheckLogin)")
    public void checkLogin(ProceedingJoinPoint point) {
        AuthUtil.checkLogin();
    }
}
