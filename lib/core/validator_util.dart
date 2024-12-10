class ValidatorUtil {
  static String? validatorId(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'ID 입력해주세요!00';
    }
    if (value!.length < 2) {
      return 'ID는 2자 이상 입력해주세요!';
    }
    return null;
  }

  static String? validatorNickname(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return '닉네임을 입력해주세요!';
    }
    if (value!.length < 2) {
      return '닉네임은 2자 이상 입력해주세요!';
    }
    return null;
  }

  static String? validatorPassword(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return '비밀번호를 입력해주세요!';
    }
    if (value!.length < 2) {
      return '비밀번호는 2자 이상 입력해주세요!';
    }
    return null;
  }

  static String? validatorTitle(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return '상품명을 입력해주세요!';
    }
    if (value!.length < 2) {
      return '상품명을 2자 이상 입력해주세요!';
    }
    return null;
  }

  static String? validatoPrice(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return '가격을 입력해주세요!';
    }

    return null;
  }

  static String? validatoContent(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return '상품내용을 입력해주세요!';
    }

    return null;
  }
}
