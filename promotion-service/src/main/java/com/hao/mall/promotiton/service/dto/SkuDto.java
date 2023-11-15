/**
 * @author lidihao
 * @Description:
 */

package com.hao.mall.promotiton.service.dto;


import lombok.Data;

@Data
public class SkuDto {

    private String skuCode;

    private Long skuId;

    private String skuName;

    private String categoryCode;
}
