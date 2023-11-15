/**
 * @author lidihao
 * @Description:
 */

package com.hao.mall.promotiton.service.dto;


import lombok.Data;

import java.util.List;

/**
 *
 * 会员信息
 */
@Data
public class MemberDto {

    private Long memberId;

    //会员等级
    private Integer memberLevel;

    // 用户所在用户群id
    private List<Long> memberGroupIds;
}
