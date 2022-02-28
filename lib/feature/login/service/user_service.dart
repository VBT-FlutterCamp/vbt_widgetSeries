import 'package:vexana/vexana.dart';

import '../model/user_req_model.dart';
import '../model/user_res_model.dart';

abstract class IUserService {
  final INetworkManager networkManager;

  IUserService(this.networkManager);

  Future<UserResponseModel?> login(UserRequestModel userRequestModel);
}

class UserService extends IUserService {
  UserService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<UserResponseModel?> login(UserRequestModel userRequestModel) async {
    final response = await networkManager.send<UserResponseModel, UserResponseModel>('api/login',
        data: userRequestModel, parseModel: UserResponseModel(), method: RequestType.POST);
    return response.data;
  }
}
