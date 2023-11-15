/**
 * @author lidihao
 * @Description:
 */

package com.hao.mall.promotiton.service.dto;


import lombok.Data;

@Data
public class FindHitPromotionRuleReqDto {

    //用户信息
    private MemberDto memberDto;

    // 门店code
    private String storeCode;


}
