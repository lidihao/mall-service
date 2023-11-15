/**
 * @author: lidihao
 * @Description:
 * @date: 2023/11/10
 */
package com.hao.mall.promotiton.service.service.remote;

import com.hao.mall.promotiton.service.dto.MemberDto;

public interface MemberRemoteService {


    MemberDto getMemberDtoById(Long memberId);

}
