package cn.mju.wjh.common.core.utils;


import cn.mju.wjh.common.core.enums.HttpStatus;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Map;

/**
 * ClassName: Result
 * Package: cn.edu.mju.joygle.common.result
 * Description: 统一结果集
 *
 * @Author:wjh
 * @Create:2023-05-2023/5/20--11:48
 */
@Data
@NoArgsConstructor
public class Result<T> {

    /**
     * 状态码
     */
    private Integer code;

    /**
     * 返回信息
     */
    private String message;

    /**
     * 返回数据
     */
    private T data;

    /**
     * 返回信息
     * @param message 信息
     * @return 结果集
     */
    public Result message(String message) {
        this.setMessage(message);
        return this;
    }

    /**
     * 返回状态码
     * @param code 状态码
     * @return 结果集
     */
    public Result code(Integer code) {
        this.setCode(code);
        return this;
    }

    /**
     * 构建结果集(带数据)
     * @param data 数据
     * @return 结果集
     * @param <T> 数据的类型
     */
    public static <T> Result<T> build(T data) {
        Result<T> result = new Result<>();
        if (data != null) {
            result.setData(data);
        }
        return result;
    }

    /**
     * 构建结果集(带数据、状态码、信息)
     * @param data 数据
     * @param code 状态码
     * @param message 信息
     * @return 结果集
     * @param <T> 数据的类型
     */
    public static <T> Result<T> build(T data, Integer code, String message) {
        Result<T> result = Result.build(data);
        result.setCode(code);
        result.setMessage(message);
        return result;
    }

    /**
     * 构建结果集(带数据、状态码枚举类型)
     * @param data 数据
     * @param httpStatus 状态码和信息
     * @return 结果集
     * @param <T> 数据的类型
     */
    public static <T> Result<T> build(T data, HttpStatus httpStatus) {
        Result<T> result = Result.build(data);
        result.setCode(httpStatus.getCode());
        result.setMessage(httpStatus.getMessage());
        return result;
    }

    /**
     * 成功(无数据)
     * @return 结果集
     * @param <T> 数据类型
     */
    public static <T> Result<T> ok() {
        return Result.ok(null);
    }

    /**
     * 成功(带数据)
     * @param data 数据
     * @return 结果集
     * @param <T> 数据的类型
     */
    public static <T> Result<T> ok(T data) {
        return Result.build(data, HttpStatus.OK);
    }

    /**
     * 失败(无数据)
     * @return 结果集
     * @param <T> 数据的类型
     */
    public static <T> Result<T> fail() {
        return Result.fail(null);
    }

    /**
     * 失败(带数据)
     * @param data 数据
     * @return 结果集
     * @param <T> 数据的类型
     */
    public static <T> Result<T> fail(T data) {
        return Result.build(data,HttpStatus.SERVER_ERROR);
    }

    /**
     * 校验错误
     * @param bindingResult 校验结果
     * @return 数据的类型
     */
    public static Result validateError(BindingResult bindingResult) {

        if (!bindingResult.hasErrors()) {
            return null;
        }

        Map<String, String> fieldErrors = new HashMap<>();

        for (FieldError error : bindingResult.getFieldErrors()) {
            fieldErrors.put(error.getField(), error.getCode() + " | " + error.getDefaultMessage());
        }

        return Result.build(fieldErrors, HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE);
    }
}
