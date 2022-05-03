abstract class BaseMapper<BaseData, BaseModel> {
  BaseModel mapperTo(BaseData data);

  BaseData mapperFrom(BaseModel data) => throw UnimplementedError();
}
